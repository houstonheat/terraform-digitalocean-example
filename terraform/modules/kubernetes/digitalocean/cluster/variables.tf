variable "kubernetes_version" {
  type = string
  description = "K8S version. Grab the latest version slug from `doctl kubernetes options versions`"
}

variable "name" {
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
}

variable "region" {
  type = string
  description = "The region to create cluster, like ``ams3`` , ``nyc2``, ``tor1``. "
}

variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the Kubernetes cluster will be located."
}
variable "instance_type" {
  type = string
  description = "Default node-pool instance type"
}
