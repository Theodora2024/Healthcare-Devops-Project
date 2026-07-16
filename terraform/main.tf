
# Root Module

# VPC Module
module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  common_tags = local.common_tags

}
# Security Group Module
module "security_group" {

  source = "./modules/security-group"

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  ssh_ingress_cidr = var.ssh_ingress_cidr

  common_tags = local.common_tags

}
# IAM Module
module "iam" {

  source = "./modules/iam"

  project_name = var.project_name

  environment = var.environment

  common_tags = local.common_tags

}
# EC2 Module
module "ec2" {

  source = "./modules/ec2"

  project_name          = var.project_name
  environment           = var.environment
  instance_type         = var.instance_type
  subnet_id             = module.vpc.public_subnet_ids[0]
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam.instance_profile_name
  key_name              = var.key_name
  root_volume_size      = var.root_volume_size
  common_tags           = local.common_tags

  depends_on = [
    module.iam
  ]
}

# S3 Module 
module "s3" {

  source = "./modules/s3"

  project_name = var.project_name

  environment = var.environment

  common_tags = local.common_tags

  log_retention_days = var.log_retention_days

}

# CloudWatch Module
module "cloudwatch" {

  source = "./modules/cloudwatch"

  project_name = var.project_name

  environment = var.environment

  instance_id = module.ec2.instance_id

  common_tags = local.common_tags

  depends_on = [
    module.ec2
  ]

}
