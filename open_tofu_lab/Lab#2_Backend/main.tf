terraform {
  required_version = ">= 1.0.0"
/*
  backend "s3" {
      # Nahraďte jméno bucketu
      bucket = ""
      key = "State/terraform.tfstate"
      region= "us-east-1"
      # Nahraďte jméno DynamoDB table
      dynamodb_table = ""
      encrypt        = true
      profile = "Backend-profile"
     } */
}

provider "aws" {
  profile = "Backend-profile"
  region  = "${var.aws_region}"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.S3_bucket_prefix}-${var.environment}-${var.aws_region}"
  force_destroy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.table_name}-${var.environment}"
  read_capacity = 1
  write_capacity = 1
  hash_key     = "LockID"

  # Musí obsahovat Primary key === LockID.
  # Pomocí LockID terraform spravuje locking.
  # Pokud LockID chybí, locking bude deaktivován.
  attribute {
    name = "LockID"
    type = "S"
  }
}