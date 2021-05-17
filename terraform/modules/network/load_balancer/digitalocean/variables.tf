#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
variable "name" {
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
  default     = ""
}

variable "region" {
  type = string
  description = "The region to create VPC, like ``ams3`` , ``nyc2``, ``tor1``. "
}

variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the Kubernetes cluster will be located."
}

variable "redirect" {
  type = bool
  description = "Redirect http to https"
}

variable "tls_passthrough" {
  type = bool
  description = "A boolean value indicating whether SSL encrypted traffic will be passed through to the backend Droplets."
}
