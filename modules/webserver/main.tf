terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_subnet" "webserver_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
}

resource "aws_eip" "webserver-eip" {
  instance = aws_instance.webserver.id
  vpc      = true
}

resource "aws_security_group" "webserver-sg" {
  name = "traffic-sg"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      cidr_blocks = ["0.0.0.0/0"]
      description = "allow ${port.value}"
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
    }
  }
}

resource "aws_instance" "webserver" {
  ami             = var.ami           //"ami-082b5a644766e0e6f"
  instance_type   = var.instance_type //"t2.micro"
  subnet_id       = aws_subnet.webserver_subnet.id
  security_groups = [aws_security_group.webserver-sg.name]
  user_data = file("./modules/webserver/userdata.tpl")
  tags = {
    "Name" = var.EC2_name
  }
}
