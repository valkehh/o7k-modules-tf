locals {
  all_security_group_ids = concat([var.security_group_default_id], var.extra_security_group_ids)
}

locals {
  cloud_init = templatefile("${path.module}/templates/cloud-init.tpl", {
    ssh_keys = var.ssh_public_keys
  })
}
