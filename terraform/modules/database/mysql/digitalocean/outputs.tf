#Module      : mysql cluster
#Description :
output "id" {
  value       = join("", digitalocean_database_cluster.mysql.*.id)
  description = "The unique identifier for the MySQL Cluster."
}
