terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0" #versão mais estavel e atualizada
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "this" {
  # Amazon Linux 2023 AMI 2023.8.20250808.1 x86_64 HVM kernel-6.1
  ami                         = "ami-0de716d6197524dd9"
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.ec2_sg.sg_id]
  subnet_id = var.subnet_id
  key_name = var.ec2_name
  instance_type               = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
}

module "ec2_sg" {
  source                 = "../modules/aws-security-group"
  vpc_id                 = var.vpc_id
  sg_name                = var.ec2_name
  create_ssh_rule        = true
  ssh_port_cidr          = var.ssh_port_cidr
  create_http_all_rule   = true
  create_https_all_rule  = true
  create_egress_all_rule = true
  tags = {
    team = "platform-engineering"
  }
}