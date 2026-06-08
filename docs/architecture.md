# Arquitetura da Solução

## Visão Geral

A solução foi desenvolvida na Amazon Web Services (AWS) e utiliza Infrastructure as Code (IaC) através de Terraform para provisionar todos os recursos necessários.

A aplicação é executada numa instância EC2 através de um contentor Docker e comunica com uma base de dados PostgreSQL alojada no Amazon RDS.

A solução inclui ainda uma fila Amazon SQS para suportar comunicação assíncrona entre componentes.

## Componentes

### Amazon EC2

Responsável pela execução da aplicação Node.js contentorizada através de Docker.

### Amazon RDS PostgreSQL

Responsável pelo armazenamento persistente dos dados da aplicação.

A base de dados encontra-se alojada em subnets privadas e apenas é acessível a partir da instância EC2.

### Amazon SQS

Fila de mensagens preparada para suportar processamento assíncrono e integração entre serviços.

### GitHub Actions

Responsável pela automatização do processo de build e deploy da aplicação.

### GitHub Container Registry (GHCR)

Responsável pelo armazenamento das imagens Docker utilizadas pela aplicação.

## Fluxo da Aplicação

```text
Utilizador
     |
     v
EC2 (Node.js API)
     |
     v
RDS PostgreSQL

GitHub
     |
     v
GitHub Actions
     |
     v
GHCR
     |
     v
EC2
```

## Fluxo de Dados

1. O utilizador envia um pedido HTTP para a API.
2. A API processa o pedido.
3. A API consulta a base de dados PostgreSQL.
4. Os dados são devolvidos ao utilizador em formato JSON.
5. Quando existe uma nova versão da aplicação, o GitHub Actions cria uma nova imagem Docker e faz o deploy automaticamente na EC2.