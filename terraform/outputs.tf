
output "vpc_id" {

  value = module.vpc.vpc_id

}

output "public_subnets" {

  value = module.vpc.public_subnet_ids

}

output "private_subnets" {

  value = module.vpc.private_subnet_ids

}

output "backend_repository" {

  value = module.ecr.backend_repository_url

}

output "frontend_repository" {

  value = module.ecr.frontend_repository_url

}

output "alb_dns_name" {

  value = module.alb.alb_dns_name

}

output "database_endpoint" {
  value = module.rds.db_endpoint
}


output "ecs_cluster" {

  value = module.ecs.cluster_name

}

output "backend_service" {

  value = module.ecs.backend_service_name

}

output "frontend_service" {

  value = module.ecs.frontend_service_name

}