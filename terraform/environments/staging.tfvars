project_name = "healthcare"

environment = "staging"

instance_type = "t3.small"

root_volume_size = 50

key_name = "staging-key"

ssh_ingress_cidr = "10.0.0.0/16"

vpc_cidr = "10.1.0.0/16"

availability_zones = [
  "eu-west-2a",
  "eu-west-2b"
]

public_subnet_cidrs = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

private_subnet_cidrs = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]