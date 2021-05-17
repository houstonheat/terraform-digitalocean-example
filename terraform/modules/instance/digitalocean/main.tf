#Module      : Instance
#Description : Module provides single droplet installation.
resource "digitalocean_droplet" "droplet" {
    name = var.name
    region = var.region
    size = var.size
    image = var.image
    backups = false
    ssh_keys = var.ssh_keys
    vpc_uuid = var.vpc_uuid
    monitoring = true
}