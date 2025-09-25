variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.small"
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "project_name" {
  description = "Tag name for project"
  type        = string
  default     = "jenkins"
}
