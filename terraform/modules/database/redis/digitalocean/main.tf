resource "digitalocean_database_cluster" "redis" {
  engine = "redis"
  name = var.name
  node_count = var.node_count
  region = var.region
  size = var.redis_instance_type
  private_network_uuid = var.vpc_id
  version = var.redis_version
}