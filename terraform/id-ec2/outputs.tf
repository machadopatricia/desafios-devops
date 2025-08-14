output "ec2_public_ip" {
  description = "IP público aplicado à instância, caso exista"
  value       = aws_instance.this.public_ip
}