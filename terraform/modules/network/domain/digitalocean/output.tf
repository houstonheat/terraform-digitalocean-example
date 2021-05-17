#Module      : Domain
output "id" {
  value       = join("", digitalocean_domain.example_domain.*.id)
  description = "The unique identifier for the Domain."
}

output "urn" {
  value       = join("", digitalocean_domain.example_domain.*.urn)
  description = " The uniform resource name (URN) for the Doamin."
}