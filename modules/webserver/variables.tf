variable "vpc_id" {
  type = string
  description = "VPC_id"
}

variable "cidr_block" {
  type = string
  description =  "subnet cidr block"
}

variable "EC2_name" {
  type = string
  description = "name of the EC2  instance"
}

variable "ami" {
  type = string
  description = "AMI to use on the EC2 instance"
  default = "ami-082b5a644766e0e6f"
}

variable "instance_type" {
  type = string
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "ingressrules" {
  type = list(number)
  default = [ 80, 443, 22 ]
}