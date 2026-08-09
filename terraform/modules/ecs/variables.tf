variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "frontend_target_group_arn" {
  type = string
}

variable "backend_target_group_arn" {
  type = string
}

variable "frontend_repository_url" {
  type = string
}

variable "backend_repository_url" {
  type = string
}

variable "frontend_container_port" {
  default = 80
}

variable "backend_container_port" {
  default = 5000
}

variable "desired_count" {
  default = 2
}

variable "cpu" {
  default = 512
}

variable "memory" {
  default = 1024
}

variable "database_url" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}
variable "secret_arn" {

  type = string

}
variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}
