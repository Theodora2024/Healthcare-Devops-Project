###################################
# General
###################################

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

###################################
# Networking
###################################

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "ssh_ingress_cidr" {
  type = string
}

###################################
# EC2
###################################

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "root_volume_size" {
  type = number
}

###################################
# Database
###################################

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
}


###################################
# Application
###################################

variable "secret_key" {
  type      = string
  sensitive = true
}

###################################
# Monitoring
###################################

variable "log_retention_days" {
  type    = number
  default = 30
}
