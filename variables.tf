variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  default = "project-aws"
}

variable "environment" {
  default = "dev"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}