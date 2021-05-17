
variable "name" {
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
}

variable "region" {
  type = string
  description = "The region to create cluster, like ``ams3`` , ``nyc2``, ``tor1``. "
}

variable "node_count" {
  type = number
  description = "Count of master nodes in cluster"
}
variable "mysql_instance_type" {
  type = string
  description = "Cluster resources size"
}

variable "mysql_version" {
  type = string
  description = "Mysql major version, e.g. `8`"
}
variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the Kubernetes cluster will be located."
}