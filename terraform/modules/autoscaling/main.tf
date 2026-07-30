resource "aws_appautoscaling_target" "backend" {

  max_capacity = var.max_capacity

  min_capacity = var.min_capacity

  resource_id = "service/${var.cluster_name}/${var.backend_service_name}"

  scalable_dimension = "ecs:service:DesiredCount"

  service_namespace = "ecs"

}
resource "aws_appautoscaling_policy" "backend_cpu" {

  name = "backend-cpu"

  service_namespace = "ecs"

  scalable_dimension = "ecs:service:DesiredCount"

  resource_id = aws_appautoscaling_target.backend.resource_id

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ECSServiceAverageCPUUtilization"

    }

    target_value = 70

  }

}
resource "aws_appautoscaling_target" "frontend" {

  max_capacity = var.max_capacity

  min_capacity = var.min_capacity

  resource_id = "service/${var.cluster_name}/${var.frontend_service_name}"

  scalable_dimension = "ecs:service:DesiredCount"

  service_namespace = "ecs"

}
resource "aws_appautoscaling_policy" "frontend_cpu" {

  name = "frontend-cpu"

  service_namespace = "ecs"

  scalable_dimension = "ecs:service:DesiredCount"

  resource_id = aws_appautoscaling_target.frontend.resource_id

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ECSServiceAverageCPUUtilization"

    }

    target_value = 70

  }

}