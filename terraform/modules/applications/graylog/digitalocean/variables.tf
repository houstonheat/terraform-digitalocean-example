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

variable "graylog_droplet_type" {
  type = string
  description = "The type of Droplet for graylog instance."
}

/*variable "elastic_droplet_type" {
  type = string
  description = "The type of Droplet for graylog instance."
  default = ""
}

variable "storage_size" {
  type = number
  description = "Size of log storage volume in GB.  If updated, can only be expanded."
  default = 0
}*/

variable "vpc_uuid" {
  type = string
  description = "The ID of the VPC where the Droplet will be located"
}

variable "ssh_keys" {
  type = list(string)
  description = "A list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API, to retrieve them."
  default = []
}
