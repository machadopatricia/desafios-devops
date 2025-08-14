variable "aws_region" {
  description = "A região da cloud em que será provisionada a instância (obrigatório)"
  type        = string
}

variable "ec2_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "ec2-test"
}

variable "tags" {
  description = "Tags a serem adicionadas ao recurso"
  type        = map(string)
  default     = {}
}

variable "ssh_port_cidr" {
  description = "IP ou range necessário para a liberação da porta SSH (obrigatório)"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC que o SG vai usar"
  default = ""
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet que a EC2 vai estar"
  default = ""
  type        = string
}