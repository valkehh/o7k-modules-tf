variable "instance_name" {
  type = string
}

variable "instance_metadata" {
  type    = object({})
  default = {}
}

variable "instance_groups" {
  type    = list(string)
  default = []
}

variable "image_id" {
  type    = string
  default = "7347976f-e269-4357-8691-2fb9ff45b1e1"
}

variable "instance_flavor" {
  type    = string
  default = "general1-2"
}

variable "boot_volume_size" {
  type    = number
  default = 10
}

variable "ssh_public_keys" {
  description = "List of public SSH keys"
  type        = list(string)

}

variable "network_id" {
  type = string
  default = "26c07d02-8579-41f3-af47-ce5d8c341d61"
}

variable "subnet_id" {
  type = string
  default = "26cc7d6d-80a6-49d3-8e6a-c5852a6baeea"
}

variable "security_group_default_id" {
  type = string
  default = "54123ffc-6b6a-4c3d-8dbb-101946b42057"
}

variable "extra_security_group_ids" {
  type    = list(string)
  default = []
}
