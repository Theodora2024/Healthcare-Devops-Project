resource "aws_lb" "this" {

  name = "${var.project_name}-${var.environment}-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [var.alb_security_group_id]

  subnets = var.public_subnet_ids

  enable_deletion_protection = false


  tags = var.common_tags
}
resource "aws_lb_target_group" "frontend" {

  name = "${var.project_name}-${var.environment}-frontend"

  port = var.frontend_port

  protocol = "HTTP"

  target_type = "ip"

  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }


}
resource "aws_lb_target_group" "backend" {

  name = "${var.project_name}-${var.environment}-backend"

  port = var.backend_port

  protocol = "HTTP"

  target_type = "ip"

  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/health"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

}
resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.frontend.arn

  }

}
resource "aws_lb_listener_rule" "backend" {

  listener_arn = aws_lb_listener.http.arn

  priority = 100

  action {

    type = "forward"

    target_group_arn = aws_lb_target_group.backend.arn

  }

  condition {

    path_pattern {

      values = ["/api/*"]

    }

  }

}