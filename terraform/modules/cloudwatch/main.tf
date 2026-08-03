resource "aws_cloudwatch_log_group" "healthcare_logs" {

  name = "/aws/ec2/${var.project_name}-${var.environment}"

  retention_in_days = var.log_retention_days

  tags = var.common_tags

}
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {

  alarm_name = "${var.project_name}-${var.environment}-cpu-high"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace           = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "High CPU utilization"

  dimensions = {

    InstanceId = var.instance_id

  }

}
resource "aws_cloudwatch_metric_alarm" "status_check" {

  alarm_name = "${var.project_name}-${var.environment}-status-check"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "StatusCheckFailed"

  namespace           = "AWS/EC2"

  period = 300

  statistic = "Maximum"

  threshold = 1

  alarm_description = "EC2 status check failed"

  dimensions = {

    InstanceId = var.instance_id

  }

}
resource "aws_cloudwatch_dashboard" "dashboard" {

  dashboard_name = "${var.project_name}-${var.environment}-dashboard"

  dashboard_body = jsonencode({

    widgets = []

  })

}
