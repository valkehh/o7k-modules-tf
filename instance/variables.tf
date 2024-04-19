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
  default = "f2d95e6d-35f4-410c-ac11-c2be4fb5ab01"
}

variable "instance_flavor" {
  type    = string
  default = "general1-2"
}

variable "boot_volume_size" {
  type    = number
  default = 60
}

variable "ssh_public_keys" {
  description = "List of public SSH keys"
  type        = list(string)
  default     = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOHz8cO/dB9R4Hpz0b309pHWqB6zNUvsAegGyEOF8zc4UgnL3HpRlApTMtD34BiH4ojmV2t/7MEoPbeiFJtjHxfFt2iNKgKX/8gtJyxGpAtZw4I3ZWOUP/mAxuyUc9JHJdWgj22udGnWI/2ndvNuO2R7gqCE44D4RfN+kl9kXfWeuqJYizJZa6bBxjbXnUVEsxJcyQ4CxLUdBBMaGNMuX7B40u9m9392QLg+Ez34kE0duPUq8c7dvV4Xmwt3yiTUDNIdlGnrurLgpztSIXZOkrFhoxwZnPpDmjc5OnjIIeLrd1xdjXCi813tQkwEASnzB0PD3u/8wFY6GKv1++MUiS7BdOnUtsgh7aMXrcOCN/3kOK0XhaYsWKm46r1HiTHUDQvLUoJkI0fv36No41eIP8L43YpXCJGykDbIlkhPbJ+OW88+NGrWexG5Ka4Ymclt5PjbOYo8nrLKFDhRwbjxi+tb9rwZyL0p7IAq1cwvNQbBtELHibcR1938hVEjb3fs2eg/7xCxWftVYJvugTkLxZlR2ASNqx9r8jGuHyvoO17Ak2GfgBJxo0a9zVy6lK7AFZDhjpzWpjKA6Kgfe9f8z14cY0RLi0q951GLbvNKNEr3Fc6eBvaUfVjwLHwkufHg8+gkhd7Q/kJhA96nhCulTeEjdiYGkJQ2WAt4FwuTffsQ== albin_berg@yahoo.com"]

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
