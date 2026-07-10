variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Deployment Environment"
  type        = string
}

variable "owner" {
  description = "Project Owner"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}
variable "ssh_ingress_cidr" {
  description = "Allowed SSH CIDR"
  type        = string
}
variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}
variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}
variable "log_retention_days" {
  description = "Number of days before log files expire"
  type        = number
  default     = 90
}