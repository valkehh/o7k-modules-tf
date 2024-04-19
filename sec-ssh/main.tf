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
