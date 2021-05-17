# main.tf
# Another node pool for applications
resource digitalocean_kubernetes_node_pool "node_pool" {
  count    = var.pool_count

  name = var.name
  cluster_id = var.cluster_id
  size = var.instances_type

  auto_scale = true
  min_nodes  = var.min_nodes
  max_nodes  = var.max_nodes
}
