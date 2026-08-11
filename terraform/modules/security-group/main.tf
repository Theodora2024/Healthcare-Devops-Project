resource "aws_security_group" "healthcare_sg" {

  name = "${var.project_name}-${var.environment}-sg"

  description = "Security Group for Healthcare Application"

  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-sg"
    }
  )

}
resource "aws_vpc_security_group_ingress_rule" "ssh" {

  security_group_id = aws_security_group.healthcare_sg.id

  cidr_ipv4 = var.ssh_ingress_cidr

  from_port = 22

  to_port = 22

  ip_protocol = "tcp"

  description = "SSH Access"

}
resource "aws_vpc_security_group_ingress_rule" "http" {

  security_group_id = aws_security_group.healthcare_sg.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80

  to_port = 80

  ip_protocol = "tcp"

  description = "HTTP"

}
resource "aws_vpc_security_group_ingress_rule" "https" {

  security_group_id = aws_security_group.healthcare_sg.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443

  to_port = 443

  ip_protocol = "tcp"

  description = "HTTPS"

}
resource "aws_vpc_security_group_egress_rule" "all_outbound" {

  security_group_id = aws_security_group.healthcare_sg.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

  description = "Allow all outbound traffic"

}
resource "aws_security_group" "alb" {
  name   = "${var.project_name}-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
resource "aws_security_group" "rds" {

  name = "${var.project_name}-rds-sg"

  vpc_id = var.vpc_id

}
resource "aws_security_group" "ecs" {
  name        = "${var.project_name}-${var.environment}-ecs-sg"
  description = "Security group for ECS tasks"
  vpc_id      = var.vpc_id

  # Frontend
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
    description     = "Allow ALB to reach frontend on port 80"
  }

  # Backend
  ingress {
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
    description     = "Allow ALB to reach backend on port 5000"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}