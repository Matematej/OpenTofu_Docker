variable "aws_region" {
  description = "Region"
  type        = string
  default = "us-east-1"
}

variable "S3_bucket_prefix" {
  description = "Prefix of the S3 bucket"
  type        = string
  default = ""
}

variable "environment" {
  description = "Prostředí"
  type        = string
  default = "prod"
}

variable "S3_region" {
  description = "Region pro S3 bucket"
  type        = string
  default = "us-east-1"
}

variable "table_name" {
  description = "Název DynamoDB table"
  type        = string
  default = ""
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance"
}