terraform {
    required_version = ">= 0.12"
}

#Module      : Domain
#Description : 
resource "digitalocean_domain" "example_domain" {
    name = var.name
}
