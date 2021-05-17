terraform {
    required_version = ">= 0.12"
}

resource "digitalocean_loadbalancer" "loadbalancer" {
    name = var.name
    region = var.region
    vpc_uuid = var.vpc_id
    redirect_http_to_https = var.redirect

    forwarding_rule {
        entry_port = 443
        entry_protocol = "https"

        target_port = 443
        target_protocol = "https"

        tls_passthrough = var.tls_passthrough
    }
}