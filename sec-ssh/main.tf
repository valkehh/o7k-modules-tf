#########################
###        SSH        ###
#########################
resource "openstack_networking_secgroup_v2" "sg_ssh" {
  name        = format("%s-ssh", var.name)
  description = format("SSH for %s", var.name)
}

resource "openstack_networking_secgroup_rule_v2" "sg_ssh_rule1" {
  count             = length(var.allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = format("%s/32", var.allowed_ips[count.index])
  security_group_id = openstack_networking_secgroup_v2.sg_ssh.id
}
