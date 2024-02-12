locals {
  instance_name = "${var.instance_prefix}${var.instance_suffix != "" ? "-${var.instance_suffix}" : ""}"
  all_security_group_ids = concat([var.security_group_default_id, openstack_networking_secgroup_v2.sg_ssh.id], var.extra_security_group_ids)
}

locals {
  cloud_init = templatefile("${path.module}/templates/cloud-init.tpl", {
    ssh_keys = var.ssh_public_keys
  })
}
