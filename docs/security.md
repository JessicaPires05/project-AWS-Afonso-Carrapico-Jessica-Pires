# Segurança

## Gestão de Acessos

O acesso à instância EC2 é efetuado através de autenticação baseada em chaves SSH.

Não são utilizadas palavras-passe para acesso remoto.

## Security Groups

Foram configuradas regras específicas para permitir apenas o tráfego necessário.

### EC2

- SSH (22)
- HTTP (80)
- HTTPS (443)

### RDS

- PostgreSQL (5432)
- Acesso apenas a partir da instância EC2

## Base de Dados

A instância PostgreSQL encontra-se em subnets privadas.

A comunicação entre a aplicação e a base de dados utiliza SSL.

## GitHub Secrets

As credenciais utilizadas durante o processo de deployment são armazenadas através de GitHub Secrets.

As seguintes informações não são armazenadas diretamente no código:

- Chave SSH
- Password da base de dados
- Endereços de infraestrutura
- Variáveis de ambiente

## Terraform

O estado do Terraform encontra-se armazenado em:

- Amazon S3
- Amazon DynamoDB para controlo de bloqueio

Isto permite evitar alterações concorrentes à infraestrutura.