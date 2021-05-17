variable "name" {
  type = string
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
}

variable "pool_count" {
  type = number
  description = "Number of node pools"
}

variable "cluster_id" {
  type = string
  description = "ID of cluster where to assign pool"
}

variable "instances_type" {
  type = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
}
variable "min_nodes" {
  type = number
  description = "Min nodes count."
}
variable "max_nodes" {
  type = number
  description = "Max nodes count."
}