variable "instance_prefix" {
  type    = string
}

variable "instance_suffix" {
  type    = string
  default = "bastion"
}

variable "instance_metadata" {
  type = object({})
  default = {
    node_type = "bastion"
  }
}

variable "instance_groups" {
  type = list(string)
  default = []
}

variable "image_id" {
  type    = string
  default = "f2d95e6d-35f4-410c-ac11-c2be4fb5ab01"
}
variable "instance_flavor" {
  type    = string
  default = "compute1-8"
}

variable "boot_volume_size" {
  type    = number
  default = 60
}

variable "ssh_public_keys" {
  description = "List of public SSH keys"
  type    = list(string)
}

variable "network_id" {
  type    = string
}

variable "subnet_id" {
  type    = string
}

variable "allowed_ips" {
  type = list(string)
  default = []
}

variable "security_group_default_id" {
  type    = string
}

variable "extra_security_group_ids" {
  type    = list(string)
  default = []
}

variable "cluster_hosts" {
  type = map(object({
    fixed_ip  = string
    groups    = list(string)
    variables = map(any)
  }))
}
