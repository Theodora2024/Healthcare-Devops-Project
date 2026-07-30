
resource "aws_ecs_service" "backend" {

  name = "${var.project_name}-backend"

  cluster = aws_ecs_cluster.this.id

  task_definition = aws_ecs_task_definition.backend.arn

  desired_count = var.desired_count

  launch_type = "FARGATE"

  network_configuration {

    subnets = var.subnet_ids

    security_groups = [var.security_group_id]

    assign_public_ip = false

  }

  load_balancer {

    target_group_arn = var.backend_target_group_arn

    container_name = "backend"

    container_port = var.backend_container_port

  }

  depends_on = [
    aws_iam_role_policy_attachment.execution_policy
  ]
}