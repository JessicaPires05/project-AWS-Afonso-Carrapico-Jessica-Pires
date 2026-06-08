# Configuração do Ambiente

## Pré-requisitos

Antes da implementação da solução é necessário possuir:

- Conta AWS
- Terraform
- Docker
- Git
- Node.js
- Chave SSH para acesso à EC2

## Clonar o Repositório

```bash
git clone <repository-url>
cd project
```

## Inicializar Terraform

```bash
terraform init
```

## Validar a Configuração

```bash
terraform validate
```

## Visualizar Alterações

```bash
terraform plan
```

## Criar Infraestrutura

```bash
terraform apply
```

## Variáveis Necessárias

A aplicação utiliza as seguintes variáveis de ambiente:

```env
DB_HOST=
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_PORT=
```