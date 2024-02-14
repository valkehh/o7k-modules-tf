locals {
  instance_name = "${var.instance_prefix}${var.instance_suffix != "" ? "-${var.instance_suffix}" : ""}"
  all_security_group_ids = concat([var.security_group_default_id], var.extra_security_group_ids)
}

locals {
  cloud_init = templatefile("${path.module}/templates/cloud-init.tpl", {
    ssh_keys = var.ssh_public_keys
  })
}

locals {
  hosts = {
    for instance in openstack_compute_instance_v2.node : instance.name => {
      fixed_ip = instance.network.0.fixed_ip_v4
      public_ip = ""
      groups = var.instance_groups
      variables = {
        instance_name      = instance.name
        instance_ip  = instance.network.0.fixed_ip_v4
      }
    }
  }
}