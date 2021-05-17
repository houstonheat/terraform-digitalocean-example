#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
output "id" {
  value       = join("", digitalocean_record.record.*.id)
  description = "The unique identifier for the Domain record."
}

output "fqdn" {
  value       = join("", digitalocean_record.record.*.urn)
  description = "The FQDN of the record."
}
output "created_at" {
  value       = join("", digitalocean_record.record.*.created_at)
  description = "The date and time of when the VPC was created."
}