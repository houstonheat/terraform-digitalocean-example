#Module      : Volume
#Description : Block storage volumes are network-based block devices that provide additional data storage for Droplets. You can move them between Droplets and resize them at any time.
resource "digitalocean_volume" "volume" {
    name = var.name
    region = var.region
    size = var.size
}