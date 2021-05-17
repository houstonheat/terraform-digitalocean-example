# Module: ssh_keys
output "public_keys_ids" {
  value = values(digitalocean_ssh_key.public_key)[*].id
  description = "List of public ssh keys ids"
}

output "public_keys_fingerprints" {
  value = values(digitalocean_ssh_key.public_key)[*].fingerprint
  description = "List of public ssh keys fingerprints"
}