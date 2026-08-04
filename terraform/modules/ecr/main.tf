resource "aws_ecr_repository" "frontend" {

  name = "${var.project_name}-${var.environment}-frontend"
  force_delete = true
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.common_tags
}


resource "aws_ecr_repository" "backend" {

  name = "${var.project_name}-${var.environment}-backend"

  force_delete = true 
  image_tag_mutability = var.image_tag_mutability
  
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.common_tags
}
