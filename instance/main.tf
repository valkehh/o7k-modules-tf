provider "openstack" {
  user_name   = data.external.env.result["OS_USERNAME"]
  tenant_name = data.external.env.result["OS_TENANT_NAME"]
  password    = data.external.env.result["OS_PASSWORD"]
  auth_url    = data.external.env.result["OS_AUTH_URL"]
  region      = data.external.env.result["OS_REGION_NAME"]
}

data "external" "env" {
  program = ["${path.module}/env.sh"]

  # For Windows (or Powershell core on MacOS and Linux),
  # run a Powershell script instead
  #program = ["${path.module}/env.ps1"]
}

# Show the results of running the data source. This is a map of environment
# variable names to their values.
output "env" {
  value = data.external.env.result
}


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
