output "cloud_init" {
  value = local.cloud_init
  sensitive = false
}

output "hosts" {
  value = local.hosts
}