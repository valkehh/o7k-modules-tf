resource "openstack_networking_port_v2" "port_1" {
  name                  = "${var.instance_name}-port-1"
  network_id            = var.network_id
  admin_state_up        = "true"
  port_security_enabled = "true"

  fixed_ip {
    subnet_id = var.subnet_id
  }
  security_group_ids = local.all_security_group_ids
}

resource "openstack_blockstorage_volume_v3" "boot_volume" {
  name                 = "${var.instance_name}-boot"
  description          = "${var.instance_name}-boot"
  size                 = var.boot_volume_size
  image_id             = var.image_id
  enable_online_resize = "false"
}

resource "openstack_compute_instance_v2" "node" {
  name      = var.instance_name
  flavor_id = var.instance_flavor
  user_data = local.cloud_init

  network {
    port = openstack_networking_port_v2.port_1.id
  }

  metadata = var.instance_metadata

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.boot_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }
}
