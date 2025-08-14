variable "sg_name" {
  description = "Nome do Security Group"
  type        = string
  default     = "ec2-test"
}

variable "vpc_id" {
  description = "ID da VPC que o SG vai usar"
  type        = string
}

variable "ssh_port_cidr" {
  description = "IP ou range necessário para a liberação da porta SSH (obrigatório)"
  type        = string
}

variable "tags" {
  description = "Tags a serem adicionadas ao recurso"
  type        = map(string)
  default     = {}
}

variable "create_ssh_rule" {
  description = "Escolha para criar uma regra default de ingress para um determinado cidr na porta 22 (SSH)"
  type        = bool
}

variable "create_http_all_rule" {
  description = "Escolha para criar uma regra default de ingress (ALL-ALL 80)"
  type        = bool
}

variable "create_https_all_rule" {
  description = "Escolha para criar uma regra default de ingress (ALL-ALL 443)"
  type        = bool
}

variable "create_egress_all_rule" {
  description = "Escolha para criar uma regra default de egress (ALL-ALL outbound)"
  type        = bool
}