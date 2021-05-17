#Module      : Domain
#Description : General zone in which child records are created

variable "name" {
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
  default     = ""
}
