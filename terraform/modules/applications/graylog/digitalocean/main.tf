#Module      : Graylog
#Description : Module provides minimal Graylog cloud installation.
resource "digitalocean_droplet" "graylog-instance" {
    name = var.name
    region = var.region
    size = var.graylog_droplet_type
    image = var.image
    backups = false
    ssh_keys = var.ssh_keys
    vpc_uuid = var.vpc_uuid
    // TODO recreate Droplet with new parameters
    // monitoring = true
}
