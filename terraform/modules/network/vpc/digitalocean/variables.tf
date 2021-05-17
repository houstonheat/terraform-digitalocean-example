#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
variable "enable_vpc" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable vpc."
}

variable "name" {
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
  default     = ""
}

variable "region" {
  type = string
  description = "The region to create VPC, like ``ams3`` , ``nyc2``, ``tor1``. "
}

variable "ip_range" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by DO and should be overriden"
  default     = "0.0.0.0/0"
}
