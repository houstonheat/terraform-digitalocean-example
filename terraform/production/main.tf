terraform {
  backend "s3" {
    endpoint                    = "https://ams3.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "example-production-terraform-state" # Note: use uniq name per whole internet
    region                      = "us-east-1" # fake region, to emulate AWS API call
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

provider digitalocean {
}

resource "digitalocean_project" "example" {
  name        = "example"
  description = "domain.example.ru base project"
  environment = "Production"
}

# Modules
module "network" {
  source = "../modules/network/vpc/digitalocean"

  enable_vpc = true
  # eg application-name-vpc
  name = lower(join("-", [var.name, "vpc"]))
  region = var.region
  ip_range = "10.0.0.0/24"
}

module "bastion" {
  source = "../modules/instance/digitalocean"
  size = "s-1vcpu-1gb"
  image = "ubuntu-20-10-x64"
  name = lower(join("-", [var.name, "bastion"]))
  region = var.region
  vpc_uuid = module.network.id
  ssh_keys = module.ssh_keys.public_keys_ids
}

module "bastion-firewall" {
  source = "../modules/network/firewall/digitalocean"
  name =  lower(join("-", [var.name, "bastion-firewall"]))
  tags = []
  inbound_rules = [
    // TODO Добавлять VPC с помощью указания id, а не адреса, когда эти issue будут выполнены:
    // https://github.com/digitalocean/godo/issues/445
    // https://ideas.digitalocean.com/ideas/FWX-I-37
    { protocol = "tcp", port_range = "22", address = local.external_ips, lb_uids = [], droplet_ids = [], tags = [] },
  ]
  outbound_rules = [
    { protocol = "tcp", port_range = "1-65535", address = local.all_ipv4_ips, lb_uids = [], droplet_ids = [], tags = [] },
    { protocol = "udp", port_range = "1-65535", address = local.all_ipv4_ips, lb_uids = [], droplet_ids = [], tags = [] }
  ]

  // Удаление ресурсов, добавленных ниже, приведёт и к удалению
  // данного правила firewall
  droplet_ids = [
    module.bastion.id,
  ]
}

module "kubernetes_cluster" {
  source = "../modules/kubernetes/digitalocean/cluster"
  region = var.region
  vpc_id = module.network.id
  name = lower(join("-", [var.name, "k8s"]))
  kubernetes_version = "1.19.3-do.2"
  instance_type = "s-1vcpu-2gb"
}

module "node_pool" {
  source = "../modules/kubernetes/digitalocean/node_pool"
  pool_count = 1

  name = lower(join("-", [var.name, "application-pool"]))
  cluster_id = module.kubernetes_cluster.id
  instances_type = "s-2vcpu-4gb"
  min_nodes = 3
  max_nodes = 5
}

module "mysql_cluster" {
  source = "../modules/database/mysql/digitalocean"
  mysql_version = "8"
  name = lower(join("-", [var.name, "mysql"]))
  region = var.region
  node_count = 1
  mysql_instance_type = "db-s-1vcpu-2gb"
  vpc_id = module.network.id
}

module "redis_cluster" {
  source = "../modules/database/redis/digitalocean"
  redis_version = "6"
  name = lower(join("-", [var.name, "redis"]))
  region = var.region
  node_count = 1
  redis_instance_type = "db-s-1vcpu-1gb"
  vpc_id = module.network.id
}

module "domain" {
  source = "../modules/network/domain/digitalocean"
  name = "example.ru"
}

module "ssh_keys" {
  source = "../modules/ssh_keys/digitalocean"
  public_keys = var.public_keys
}

module "graylog" {
  source = "../modules/applications/graylog/digitalocean"

  graylog_droplet_type = "s-8vcpu-16gb"
  image = "ubuntu-20-10-x64"
  name = lower(join("-", [var.name, "graylog"]))
  region = var.region
  vpc_uuid = module.network.id
  ssh_keys = module.ssh_keys.public_keys_ids
}

resource "digitalocean_project_resources" "example" {
  project = digitalocean_project.example.id
  // Внимание! Удаление ресурсов, добавленных ниже, приведёт и к удалению данного
  // проекта ЦЕЛИКОМ. Для корректного удаления ресурса (перед terrafrom destroy)
  // сначала отвяжите его urn от проекта (удалите id из списка ниже)
  resources = [
    "do:kubernetes:${module.kubernetes_cluster.id}",
    "do:dbaas:${module.mysql_cluster.id}",
    "do:dbaas:${module.redis_cluster.id}",
    "do:droplet:${module.graylog.id}"
  ]
}
