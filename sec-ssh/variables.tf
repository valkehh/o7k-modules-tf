variable "name" {
  type = string
}

variable "allowed_ips" {
  type = list(string)
  default = []
}
