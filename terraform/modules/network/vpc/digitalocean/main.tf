terraform {
    required_version = ">= 0.12"
}

#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
resource "digitalocean_vpc" "example_vpc" {
    count = var.enable_vpc == true ? 1 : 0

    description = "Digital ocean VPC resource declaration"
    name = var.name
    region = var.region
    ip_range = var.ip_range
}
