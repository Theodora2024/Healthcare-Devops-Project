
output "port" {
  value = aws_db_instance.this.port
}

output "database_name" {
  value = aws_db_instance.this.db_name
}

output "db_instance_id" {
  value = aws_db_instance.this.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.this.name
}
output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}
output "database_url" {
  value     = "postgresql://${var.db_username}:${var.db_password}@${aws_db_instance.this.endpoint}/${var.db_name}"
  sensitive = true
}