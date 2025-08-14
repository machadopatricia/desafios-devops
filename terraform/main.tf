terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0" #versão mais estavel e atualizada
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

resource "aws_instance" "this" {
  # Amazon Linux 2023 AMI 2023.8.20250808.1 x86_64 HVM kernel-6.1
  ami = "ami-0de716d6197524dd9"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.ec2_sg.id]
  instance_type               = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.ec2_name}-sg"
  description = "SG do recurso ${var.ec2_name}"
  tags        = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ec2_ssh_port_cidr
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http_all_all_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "https_all_all_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "outbound_all_all_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
