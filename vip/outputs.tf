output "network_id" {
  value = openstack_networking_network_v2.net1.id
}

output "subnet_id" {
  value = openstack_networking_subnet_v2.net1_subnet1.id
}

# output "security_group_ids" {
#   value = openstack_networking_secgroup_v2.*.id
# }

# output "security_group_ids" {
#   value = [tostring(openstack_networking_secgroup_v2.sg_default.id), tostring(openstack_networking_secgroup_v2.sg_ssh.id)]
# }
