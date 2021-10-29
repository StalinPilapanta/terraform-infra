# This file creates S3 bucket to hold terraform states
# and DynamoDB table to keep the state locks.
resource "aws_s3_bucket" "terraform_infra" {
  bucket = var.bucket
  acl    = var.acl
  force_destroy = var.force_destroy
  

  # To allow rolling back states
  versioning {
    enabled = var.enabled
  }

  # To cleanup old states eventually
  lifecycle_rule {
    enabled = var.enabled_lifecycle_rule

    noncurrent_version_expiration {
      days = var.days
    }
  }
  tags = var.tags_s3

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

}

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.name_dynamodb
  # up to 25 per account is free
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = var.tags_dynamodb
}

resource "aws_kms_key" "mykey" {
  description = "key state file"
  deletion_window_in_days = 10
  
}

output "arn" {
  value = aws_kms_key.mykey.arn
}
