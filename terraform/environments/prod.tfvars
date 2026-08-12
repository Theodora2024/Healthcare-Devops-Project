project_name = "healthcare"
owner        = "Theodora"
aws_region   = "eu-west-2"

environment   = "prod"
enable_rds    = false
instance_type = "t3.small"

root_volume_size = 30

key_name = "sp-kpair"

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
db_name     = "healthcare_db"
db_username = "healthcare"

instance_class = "db.t3.small"

allocated_storage = 20

log_retention_days = 14