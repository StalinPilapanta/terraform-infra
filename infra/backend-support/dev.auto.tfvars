#aws_s3_bucket
bucket = "news4321-terraform-infra"
acl = "private"
force_destroy = true
enabled = true
enabled_lifecycle_rule = true
days = 90
tags_s3 = {
     Name = "Bucket for terraform states of news4321",
     createdBy = "infra-news4321/backend-support"
  }

#aws_dynamodb_table

name_dynamodb = "news4321-terraform-locks"
billing_mode = "PROVISIONED"
read_capacity = 2
write_capacity = 2
hash_key = "LockID"
tags_dynamodb = {
     Name = "Terraform Lock Table"
     createdBy = "infra-news4321/backend-support"
  }