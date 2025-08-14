variable "aws_region" {
  description = "A região da cloud em que será provisionada a instância (obrigatório)"
  type        = string
}

variable "ec2_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "ec2-test"
}

variable "ec2_ssh_port_cidr" {
  description = "IP ou range necessário para a liberação da porta SSH (obrigatório)"
  type        = string
}

variable "tags" {
  description = "Tags a serem adicionadas ao recurso"
  type        = map(string)
  default     = {}
}
