# Setup our aws provider

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "news4321-terraform-infra"
    region = "eu-west-1"
    dynamodb_table = "news4321-terraform-locks"
    key = "news/terraform.tfstate"
    encrypt = true
    kms_key_id = "arn:aws:kms:eu-west-1:109669590912:key/6aaa30eb-bbe3-4e2d-a5ee-b125f1810688"
  }
}
