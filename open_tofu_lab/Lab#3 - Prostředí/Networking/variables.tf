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
  default = "networking"
}

variable "table_name" {
  description = "Název DynamoDB table"
  type        = string
  default = ""
}