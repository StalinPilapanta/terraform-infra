
# provider
variable "region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.nano"
}
variable "docker_image_tag" {
  default = "latest"
}
variable "prefix" {
  default = "news4321"
}


# sg
variable "tags_sg" {
  
}

variable "ingress_rules" {
  
}

/*
# variables bucket s3
variable "bucket" {
  
}

*/