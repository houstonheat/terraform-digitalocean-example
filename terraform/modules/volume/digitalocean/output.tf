#Module      : Instance
output "id" {
  value       = join("", digitalocean_volume.volume.id)
  description = ""
}

output "urn" {
  value       = join("", digitalocean_volume.volume.*.urn)
  description = ""
}

output "droplet_ids" {
  value = join("", digitalocean_volume.volume.*.droplet_ids)
}
