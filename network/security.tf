#########################
###      Default      ###
#########################
resource "openstack_networking_secgroup_v2" "sg_default" {
  name        = format("%s-default", var.network_prefix)
  description = format("Default for %s", var.network_prefix)
}

resource "openstack_networking_secgroup_rule_v2" "sg_default_rule1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_group_id   = openstack_networking_secgroup_v2.sg_default.id
  security_group_id = openstack_networking_secgroup_v2.sg_default.id
}

resource "openstack_networking_secgroup_rule_v2" "sg_default_rule2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_group_id   = openstack_networking_secgroup_v2.sg_default.id
  security_group_id = openstack_networking_secgroup_v2.sg_default.id
}

resource "openstack_networking_secgroup_rule_v2" "sg_default_rule3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_group_id   = openstack_networking_secgroup_v2.sg_default.id
  security_group_id = openstack_networking_secgroup_v2.sg_default.id
}
