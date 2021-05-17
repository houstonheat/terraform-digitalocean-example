resource "digitalocean_database_cluster" "mysql" {
  engine = "mysql"
  name = var.name
  node_count = var.node_count
  region = var.region
  size = var.mysql_instance_type
  private_network_uuid = var.vpc_id
  version = var.mysql_version
}