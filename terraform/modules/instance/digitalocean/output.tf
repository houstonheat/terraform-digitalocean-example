#Module      : Instance
output "id" {
  value       = join("", digitalocean_droplet.droplet.*.id)
  description = "The unique identifier for the Droplet."
}

output "urn" {
  value       = join("", digitalocean_droplet.droplet.*.urn)
  description = " The uniform resource name (URN) for the Droplet."
}

output "ipv4_address" {
  value = join("", digitalocean_droplet.droplet.*.ipv4_address)
}

output "ipv4_address_private" {
  value = join("", digitalocean_droplet.droplet.*.ipv4_address_private)
}

output "created_at" {
  value       = join("", digitalocean_droplet.droplet.*.created_at)
  description = "The date and time of when the Droplet was created."
}
