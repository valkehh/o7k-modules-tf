variable "network_prefix" {
  type    = string
}

variable "external_network" {
  type        = string
  description = "The id of the external OpenStack network"
}

variable "internal_router" {
  type    = string
}

variable "subet_cidr" {
  type        = string
  default     = "10.15.0.0/24"
}

variable "subnet_allocation_pool" {
  type = object({
    end   = string
    start = string
  })
  default = {
    end   = "10.15.0.252"
    start = "10.15.0.10"
  }
}

variable "floating_ips" {
  description = "A map of floating IP configurations"
  type = map(object({
    name : string
    ip   : optional(string)
  }))
  default = {}
}

variable "allowed_ips" {
  type = list(string)
}
