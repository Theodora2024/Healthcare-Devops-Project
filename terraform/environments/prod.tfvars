project_name = "healthcare"

environment = "prod"

instance_type = "m7i.large"

root_volume_size = 100

key_name = "prod-key"

ssh_ingress_cidr = "10.0.0.0/16"

vpc_cidr = "10.2.0.0/16"

availability_zones = [
  "eu-west-2a",
  "eu-west-2b"
]

public_subnet_cidrs = [
  "10.2.1.0/24",
  "10.2.2.0/24"
]

private_subnet_cidrs = [
  "10.2.11.0/24",
  "10.2.12.0/24"
]