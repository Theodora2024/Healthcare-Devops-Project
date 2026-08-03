#########################################
# VPC
#########################################

module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  common_tags = local.common_tags
}

#########################################
# Security Groups
#########################################

module "security_group" {

  source = "./modules/security-group"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  ssh_ingress_cidr = var.ssh_ingress_cidr

  common_tags = local.common_tags

}

#########################################
# IAM
#########################################

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

  common_tags = local.common_tags

}

#########################################
# S3
#########################################

module "s3" {

  source = "./modules/s3"

  project_name = var.project_name
  environment  = var.environment

  log_retention_days = var.log_retention_days

  common_tags = local.common_tags

}

#########################################
# ECR
#########################################

module "ecr" {

  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment

  common_tags = local.common_tags

}

#########################################
# ALB
#########################################

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  alb_security_group_id = module.security_group.alb_security_group_id

  common_tags = local.common_tags

}

#########################################
# RDS
#########################################

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name
  environment  = var.environment

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  subnet_ids = module.vpc.private_subnet_ids

  security_group_ids = [
    module.security_group.rds_security_group_id
  ]

  common_tags = local.common_tags

}

#########################################
# ECS
#########################################

module "ecs" {

  source = "./modules/ecs"

  project_name = var.project_name
  environment  = var.environment

  aws_region = var.aws_region

  subnet_ids = module.vpc.private_subnet_ids

  security_group_id = module.security_group.ecs_security_group_id

  backend_repository_url  = module.ecr.backend_repository_url
  frontend_repository_url = module.ecr.frontend_repository_url

  backend_target_group_arn  = module.alb.backend_target_group_arn
  frontend_target_group_arn = module.alb.frontend_target_group_arn

  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn

  database_url = module.rds.database_url

  secret_key = var.secret_key
  secret_arn = module.secretsmanager.secret_arn

  common_tags = local.common_tags

  depends_on = [
    module.alb,
    module.ecr,
    module.rds
  ]

}

#########################################
# CloudWatch
#########################################

module "cloudwatch" {

  source = "./modules/cloudwatch"

  project_name = var.project_name
  environment  = var.environment

  instance_id = module.ecs.cluster_name

  log_retention_days = var.log_retention_days

  common_tags = local.common_tags

}

#########################################
# Auto Scaling
#########################################

module "autoscaling" {

  source = "./modules/autoscaling"

  project_name = var.project_name
  environment  = var.environment

  cluster_name = module.ecs.cluster_name

  backend_service_name = module.ecs.backend_service_name

  frontend_service_name = module.ecs.frontend_service_name

  common_tags = local.common_tags

}
module "secretsmanager" {
  source = "./modules/secretsmanager"

  project_name = var.project_name
  environment  = var.environment

  database_url = module.rds.database_url
  db_username  = var.db_username
  db_password  = var.db_password
  secret_key   = var.secret_key

  common_tags = local.common_tags
}
