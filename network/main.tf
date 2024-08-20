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
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
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
