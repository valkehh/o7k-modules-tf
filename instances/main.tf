resource "openstack_networking_port_v2" "port_1" {
  count                 = var.instance_count
  name                  = format("%s-%02d-port-1", local.instance_name, count.index + 1)
  network_id            = var.network_id
  admin_state_up        = "true"
  port_security_enabled = "true"

  fixed_ip {
    subnet_id = var.subnet_id
  }
  security_group_ids = local.all_security_group_ids
}

resource "openstack_blockstorage_volume_v3" "boot_volume" {
  count                = var.instance_count
  name                 = format("%s-%02d-boot", local.instance_name, count.index + 1)
  description          = format("%s-%02d-boot", local.instance_name, count.index + 1)
  size                 = var.boot_volume_size
  image_id             = var.image_id
  enable_online_resize = "false"
}

resource "openstack_compute_instance_v2" "node" {
  count     = var.instance_count
  name      = format("%s-%01d", local.instance_name, count.index + 1)
  flavor_id = var.instance_flavor
  user_data = local.cloud_init

  network {
    port = element(openstack_networking_port_v2.port_1.*.id, count.index)
  }

  metadata = var.instance_metadata

  block_device {
    uuid                  = element(openstack_blockstorage_volume_v3.boot_volume.*.id, count.index)
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }
}
