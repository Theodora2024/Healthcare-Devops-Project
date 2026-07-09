variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}

variable "subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile"
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair"
  type        = string
}

variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}