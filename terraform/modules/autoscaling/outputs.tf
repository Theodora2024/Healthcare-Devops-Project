output "backend_scaling_policy" {
  value = aws_appautoscaling_policy.backend_cpu.name
}

output "frontend_scaling_policy" {
  value = aws_appautoscaling_policy.frontend_cpu.name
}