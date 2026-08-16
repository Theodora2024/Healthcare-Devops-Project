resource "aws_ecs_task_definition" "frontend" {

  family = "${var.project_name}-frontend"

  requires_compatibilities = ["FARGATE"]

  network_mode = "awsvpc"

  cpu = var.cpu

  memory = var.memory

  execution_role_arn = var.execution_role_arn

  task_role_arn = var.task_role_arn

  container_definitions = jsonencode([

    {

      name = "frontend"

      image = "${var.frontend_repository_url}:latest"

      essential = true

      portMappings = [

        {

          containerPort = var.frontend_container_port

          protocol = "tcp"

        }

      ]

      logConfiguration = {

        logDriver = "awslogs"

        options = {

          awslogs-group = aws_cloudwatch_log_group.frontend.name

          awslogs-region = var.aws_region

          awslogs-stream-prefix = "frontend"

        }

      }

    }

  ])
  lifecycle {
    create_before_destroy = true
  }
}