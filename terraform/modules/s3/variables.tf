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
variable "log_retention_days" {
  description = "Number of days before log files expire"
  type        = number
  default     = 90
}
