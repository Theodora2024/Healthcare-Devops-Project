output "security_group_id" {

  description = "Security Group ID"

  value = aws_security_group.healthcare_sg.id

}
output "rds_security_group_id" {
  value = aws_security_group.rds.id
}
output "alb_security_group_id" {
  value = aws_security_group.alb.id
}
output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}