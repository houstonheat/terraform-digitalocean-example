# Firewall
resource "digitalocean_firewall" "firewall-rule" {
  name        = var.name
  tags        = var.tags

  dynamic "outbound_rule" {
    for_each = var.outbound_rules
    content {
      protocol = outbound_rule.value.protocol
      port_range = outbound_rule.value.port_range
      destination_addresses = outbound_rule.value.address
      destination_droplet_ids = outbound_rule.value.droplet_ids
      destination_load_balancer_uids = outbound_rule.value.lb_uids
      destination_tags = outbound_rule.value.tags
    }
  }
  dynamic "inbound_rule" {
    for_each = var.inbound_rules
    content {
      protocol = inbound_rule.value.protocol
      port_range = inbound_rule.value.port_range
      source_addresses = inbound_rule.value.address
      source_droplet_ids = inbound_rule.value.droplet_ids
      source_load_balancer_uids = inbound_rule.value.lb_uids
      source_tags = inbound_rule.value.tags
    }
  }

  droplet_ids = var.droplet_ids
}