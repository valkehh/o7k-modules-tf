locals {
  # instance_name = "${var.instance_prefix}${var.instance_suffix != "" ? "-${var.instance_suffix}" : ""}"
  instance_name = "${var.instance_prefix}-${var.instance_suffix}"
  all_security_group_ids = concat([var.security_group_default_id, openstack_networking_secgroup_v2.sg_ssh.id], var.extra_security_group_ids)
}

locals {
  cloud_init = templatefile("${path.module}/templates/cloud-init.tpl", {
    ssh_keys = var.ssh_public_keys
  })
}

locals {
  hosts = {
    "${openstack_compute_instance_v2.node.name}" = {
      fixed_ip = openstack_compute_instance_v2.node.network.0.fixed_ip_v4
      public_ip = openstack_networking_floatingip_v2.node_fip1.address
      groups = var.instance_groups
      variables = {
        instance_name = openstack_compute_instance_v2.node.name
        instance_ip   = openstack_compute_instance_v2.node.network.0.fixed_ip_v4
      }
    }
  }
}