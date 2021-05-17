variable "name" {
  type = string
  description = "Name to be used on all the resources as identifier"
}

variable "region" {
  type = string
  description = "The region to start in."
}

variable "image" {
  type = string
  description = "The Droplet image ID or slug."
}

variable "size" {
  type = string
  description = "The unique slug that indentifies the type of Droplet. You can find a list of available slugs on DigitalOcean API documentation."
}

variable "backups" {
  type = bool
  description = "Boolean controlling if backups are made. Defaults to false."
  default = false
}

variable "vpc" {
  type = string
  description = "The ID of the VPC where the Droplet will be located"
}

variable "ssh_keys" {
  type = string
  description = "A list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API, to retrieve them."
}
