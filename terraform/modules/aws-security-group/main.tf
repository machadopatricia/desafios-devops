terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0" #versão mais estavel e atualizada
    }
  }
}

resource "aws_security_group" "this" {
  name        = "${var.sg_name}-sg"
  vpc_id      = var.vpc_id
  description = "SG do recurso ${var.sg_name}"
  tags = merge({
    stack = "security"
  }, var.tags)
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ipv4" {
  count = var.create_ssh_rule == true ? 1 : 0

  security_group_id = aws_security_group.this.id
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ssh_port_cidr
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http_all_all_ipv4" {
  count = var.create_http_all_rule == true ? 1 : 0

  security_group_id = aws_security_group.this.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "https_all_all_ipv4" {
  count = var.create_https_all_rule == true ? 1 : 0

  security_group_id = aws_security_group.this.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "outbound_all_all_ipv4" {
  count = var.create_egress_all_rule == true ? 1 : 0

  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
