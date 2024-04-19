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

### Network ###
resource "openstack_networking_network_v2" "net1" {
  name = format("%s-network1", var.network_prefix)
  # mtu                   = 1550
  admin_state_up        = "true"
  port_security_enabled = "true"
}

### Subnet ###
resource "openstack_networking_subnet_v2" "net1_subnet1" {
  name       = format("%s-network1-subnet1", var.network_prefix)
  network_id = openstack_networking_network_v2.net1.id
  cidr       = var.subet_cidr
  allocation_pool {
    start = var.subnet_allocation_pool.start
    end   = var.subnet_allocation_pool.end
  }
}

### Router ###
resource "openstack_networking_router_interface_v2" "router1" {
  router_id = var.internal_router
  subnet_id = openstack_networking_subnet_v2.net1_subnet1.id
}
