project_name = "healthcare"
owner        = "Theodora"

aws_region  = "eu-west-2"
environment = "dev"

instance_type = "t3.micro"

root_volume_size = 30

key_name = "sp-kpair"

ssh_ingress_cidr = "0.0.0.0/0"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "eu-west-2a",
  "eu-west-2b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]
db_name     = "healthcare_db"
db_username = "healthcare"


instance_class     = "db.t3.micro"
allocated_storage  = 20
log_retention_days = 14