variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "frontend_port" {
  default = 5173
}

variable "backend_port" {
  default = 5000
}
variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}