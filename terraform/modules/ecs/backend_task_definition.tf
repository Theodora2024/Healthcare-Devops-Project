
resource "aws_ecs_task_definition" "backend" {

  family = "${var.project_name}-backend"

  requires_compatibilities = ["FARGATE"]

  network_mode = "awsvpc"

  cpu = var.cpu

  memory = var.memory

  execution_role_arn = var.execution_role_arn

  task_role_arn = var.task_role_arn

  container_definitions = jsonencode([

    {

      name = "backend"

      image = "${var.backend_repository_url}:latest"

      essential = true

      portMappings = [

        {

          containerPort = var.backend_container_port

          protocol = "tcp"

        }

      ]


      secrets = [

        {
          name      = "DATABASE_URL"
          valueFrom = var.secret_arn
        }

      ]
      logConfiguration = {

        logDriver = "awslogs"

        options = {

          awslogs-group = aws_cloudwatch_log_group.backend.name

          awslogs-region = var.aws_region

          awslogs-stream-prefix = "backend"

        }

      }

    }

  ])

}