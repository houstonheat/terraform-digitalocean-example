/*variable "do_token" {
  type = string
  description = "Personal DigitalOcean token to perform API calls"
}

variable "do_spaces_access_key" {
  type = string
  description = "Personal DigitalOcean spaces key to perform API calls to DO-Spaces"
}

variable "do_spaces_secret_key" {
  type = string
  description = "Personal DigitalOcean secret to perform API calls to DO-Spaces"
}
*/

variable "region" {
  type = string
  description = "The region to create VPC, like ``ams3`` , ``nyc2``, ``tor1``. "
  default = "ams3"
}

variable "name" {
  type = string
  description = "Name to be used on all the resources as identifier (e.g. project: `example`, `producton-project`)"
}

variable "public_keys" {
  type = map(string)
  description = "The map of ssh-keys (key_name: public_key_value)"
  default = null
}