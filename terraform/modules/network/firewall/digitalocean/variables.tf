#Module: Firewall
variable "name" {
  type        = string
  description = "Name applied to firewall rules"
}

variable "tags" {
  type        = list(string)
  description = "List of tag ids, any droplet matching these tags will have the rule set applied"
  default     = []
}

variable "droplet_ids" {
  type        = list(string)
  description = "List of Droplet ids, any droplet matching these ids will have the rule set applied"
  default     = []
}

variable "inbound_rules" {
  type = list(object({
      protocol = string
      port_range = string
      address = list(string)
      lb_uids = list(string)
      droplet_ids = list(string)
      tags = list(string)
    }))

  description = "The list of inbound firewall rules"
  default = []
}

variable "outbound_rules" {
  type = list(object({
      protocol = string
      port_range = string
      address = list(string)
      lb_uids = list(string)
      droplet_ids = list(string)
      tags = list(string)
    }))

  description = "The list of outbound firewall rules"
  default = []
}
