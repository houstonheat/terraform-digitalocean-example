#Module      : ssh_keys
#Description : Creates a set of given ssh_keys.
resource "digitalocean_ssh_key" "public_key" {
    for_each = var.public_keys

    name = each.key
    public_key = each.value
}