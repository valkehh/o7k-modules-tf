output "public_ssh_key" {
  value = tls_private_key.bastion_ssh_key.public_key_openssh
  sensitive = false
}

output "cloud_init" {
  value = local.cloud_init
  sensitive = false
}

output "hosts" {
  value = local.hosts
}
