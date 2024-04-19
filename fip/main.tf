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

resource "openstack_networking_floatingip_v2" "fip1" {
  pool  = var.fip_pool
}

resource "openstack_networking_floatingip_associate_v2" "associate_fip1" {
  floating_ip = openstack_networking_floatingip_v2.fip1.address
  port_id = var.port_id
}
