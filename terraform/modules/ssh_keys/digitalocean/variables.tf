variable "public_keys" {
  type = map(string)
  description = "The map of ssh-keys (key name = public key value)"
  default = null
}