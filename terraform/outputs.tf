
# Root Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}
output "instance_profile_name" {

  value = module.iam.instance_profile_name

}
output "ec2_public_ip" {

  value = module.ec2.public_ip

}

output "ec2_private_ip" {

  value = module.ec2.private_ip

}

output "instance_id" {

  value = module.ec2.instance_id

}
output "bucket_name" {

  value = module.s3.bucket_name

}
output "cloudwatch_dashboard" {

  value = module.cloudwatch.dashboard_name

}