variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
variable "log_retention_days" {
  description = "CloudWatch log retention period"
  type        = number
  default     = 30
}
variable "namespace" {
  default = "AWS/EC2"
}