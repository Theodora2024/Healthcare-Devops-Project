output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "frontend_service_name" {
  value = aws_ecs_service.frontend.name
}

output "backend_service_name" {
  value = aws_ecs_service.backend.name
}

output "frontend_task_definition" {
  value = aws_ecs_task_definition.frontend.arn
}

output "backend_task_definition" {
  value = aws_ecs_task_definition.backend.arn
}

output "execution_role_arn" {
  value = aws_iam_role.execution_role.arn
}

output "task_role_arn" {
  value = aws_iam_role.task_role.arn
}