# provider 
region = "eu-west-1"

# bucket
bucket_s3 = "news4321-terraform-infra"


# SG
tags_sg = {
    Name = "Allow HTTP",
    createdBy = "infra-${var.prefix}/news"
  }
ingress_rules = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["10.5.0.0/16"]
    }
]
