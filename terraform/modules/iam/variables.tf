variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
variable "secret_arn" {
  description = "Secrets Manager secret ARN used by ECS"
  type        = string
}