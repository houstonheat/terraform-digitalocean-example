#Module      : VPC
variable "domain_name" {
  type        = string
  description = "The domain name to add the record to."
}

variable "record_name" {
  type = string
  description = "The hostname of the record. Use @ for records on domain's name itself."
}

variable "records" {
  type = list(object({
    name = string
    addr = string
    ttl = number
    port = number
  }))
}

variable "type" {
  type = string
  description = "The type of record. Must be one of A, AAAA, CAA, CNAME, MX, NS, TXT, or SRV."
}

variable "record_addr" {
  type = string
  description = "The value of the record"
}

variable "record_port" {
  type = number
  description = "The port of the record. Only valid when type is SRV. Must be between 1 and 65535."
}

variable "ttl" {
  type = number
  description = "The time to live for the record, in seconds. Must be at least 0."
  default     = 3600
}
