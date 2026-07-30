
output "instance_profile_name" {
  value = aws_iam_instance_profile.this.name
}

output "role_name" {
  value = aws_iam_role.ec2_role.name
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_execution_role.arn
}

output "task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}