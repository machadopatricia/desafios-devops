# Desafio 01 - Terraform

## Como utilizar a solução
- Você vai precisar das seguintes variáveis:
ID da VPC e Subnet em que a EC2 estará
Nome de uma key pair existente (e a private key dela também em mãos)

- Adicionar os valores de VPC-ID e subnet-ID nas linhas 29 (vpc_id) e 19 (subnet_id) do main.tf localizado no diretório id-ec2. A key pair default é uma que deve ter o mesmo nome da EC2, mas caso não tenha o mesmo nome, adicionar na linha 20 (key_name)

- Rodar os seguintes comandos dentro do diretório terraform:
```
terraform init
terraform apply #informar a região aws e o CIDR para liberar a porta 22
```


No mesmo diretório da chave .pem, será possível acessar via SSH a instância EC2 com o IP público informado via output após o *terrafom apply*, exemplo:
```
ssh -i "ec2-test.pem" ec2-user@ec2-{ip com hifens}.compute-1.amazonaws.com
```

Após validação e utilização, rodar o comando *terraform destroy* para destruir os recursos criados.