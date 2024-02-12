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

# ### Metallb ###
# ## Internal ##
# resource "openstack_networking_port_v2" "metallb_port1" {
#   name                  = format("%s-metallb-port1", var.network_prefix)
#   network_id            = openstack_networking_network_v2.net1.id
#   admin_state_up        = "true"
#   port_security_enabled = "true"
#   fixed_ip {
#     subnet_id  = openstack_networking_subnet_v2.net1_subnet1.id
#     ip_address = var.metallb_vip.ip
#   }
#   security_group_ids = [
#     openstack_networking_secgroup_v2.sg_default.id,
#     openstack_networking_secgroup_v2.sg_ssh.id,
#     openstack_networking_secgroup_v2.sg_ingress_internal.id,
#   ]
#   allowed_address_pairs {
#     ip_address = var.subet_cidr
#   }
# }

# resource "openstack_networking_floatingip_associate_v2" "metallb_port1_fip1" {
#   floating_ip = var.metallb_vip.vip
#   port_id     = openstack_networking_port_v2.metallb_port1.id
# }

# # External ##
# resource "openstack_networking_port_v2" "metallb_port2" {
#   name                  = format("%s-metallb-port2", var.network_prefix)
#   network_id            = openstack_networking_network_v2.net1.id
#   admin_state_up        = "true"
#   port_security_enabled = "true"
#   fixed_ip {
#     subnet_id  = openstack_networking_subnet_v2.net1_subnet1.id
#     ip_address = var.metallb_vip_external.ip
#   }
#   security_group_ids = [
#     openstack_networking_secgroup_v2.sg_default.id,
#     openstack_networking_secgroup_v2.sg_unifi.id,
#     openstack_networking_secgroup_v2.sg_ingress_external.id,
#   ]
#   allowed_address_pairs {
#     ip_address = var.subet_cidr
#   }
# }

# resource "openstack_networking_floatingip_associate_v2" "metallb_port2_fip1" {
#   floating_ip = var.metallb_vip_external.vip
#   port_id     = openstack_networking_port_v2.metallb_port2.id
# }
