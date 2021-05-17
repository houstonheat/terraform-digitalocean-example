#Module      : Domain
#Description : 

resource "digitalocean_record" "record" {
  domain = var.domain_name
  type   = var.type
  name   = var.record_name
  value  = var.record_addr
  ttl    = var.ttl
}