#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
output "id" {
  value       = digitalocean_loadbalancer.loadbalancer.id
  description = "The unique identifier of the Load Balancer"
}

output "ip" {
  value       = digitalocean_loadbalancer.loadbalancer.ip
  description = "The ip of the Load Balancer"
}

output "urn" {
  value       = digitalocean_loadbalancer.loadbalancer.urn
  description = "The uniform resource name for the Load Balancer"
}
