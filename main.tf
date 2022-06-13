provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "ec2_webserver" {
  source     = "./modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = aws_vpc.main.cidr_block
  EC2_name   = "EC2_WebServer"
}

