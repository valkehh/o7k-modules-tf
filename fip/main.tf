resource "openstack_networking_floatingip_v2" "fip1" {
  pool  = var.fip_pool
}

resource "openstack_networking_floatingip_associate_v2" "associate_fip1" {
  floating_ip = openstack_networking_floatingip_v2.fip1.address
  port_id = var.port_id
}
