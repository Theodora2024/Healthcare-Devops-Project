variable "backend_service_name" {
  type = string
}

variable "frontend_service_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "min_capacity" {
  default = 2
}

variable "max_capacity" {
  default = 6
}
variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

