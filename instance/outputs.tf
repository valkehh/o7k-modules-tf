output "cloud_init" {
  value = local.cloud_init
  sensitive = false
}

output "port_id" {
  value = openstack_networking_port_v2.port_1.id
}

output "hostname" {
  value = openstack_compute_instance_v2.node.name
}