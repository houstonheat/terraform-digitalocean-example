#Module      : Redis cluster
#Description :
output "id" {
  value       = join("", digitalocean_database_cluster.redis.*.id)
  description = "The unique identifier for the Redis Cluster."
}
