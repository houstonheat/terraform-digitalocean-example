#Module      : kubernetes cluster
#Description : 
output "id" {
  value       = join("", digitalocean_kubernetes_cluster.kubernetes_cluster.*.id)
  description = "The unique identifier for the K8S Cluster."
}

output "kubeconfig_path_do" {
  value = local_file.kubeconfig.0.filename
}
