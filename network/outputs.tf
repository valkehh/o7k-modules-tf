output "network_id" {
  value = openstack_networking_network_v2.net1.id
}

output "subnet_id" {
  value = openstack_networking_subnet_v2.net1_subnet1.id
}

output "security_group_default_id" {
  value = openstack_networking_secgroup_v2.sg_default.id
}
