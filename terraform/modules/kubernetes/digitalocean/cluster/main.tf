# main.tf
# Deploy the actual Kubernetes cluster
resource digitalocean_kubernetes_cluster "kubernetes_cluster" {
  count   = var.kubernetes_version != "" ? 1 : 0

  name    = var.name
  region  = var.region
  version = var.kubernetes_version
  vpc_uuid = var.vpc_id

  # This default node pool is mandatory
  # https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster
  node_pool {
    name       = "default-pool"
    size       = var.instance_type # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 1
  }

  /*lifecycle {
    prevent_destroy = true
  }*/
}

resource "local_file" "kubeconfig" {
  count    = var.kubernetes_version != "" ? 1 : 0
  content  = digitalocean_kubernetes_cluster.kubernetes_cluster[count.index].kube_config[0].raw_config
  filename = "${path.root}/kubeconfig_do"
}