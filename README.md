# Projeto AWS – Infraestrutura Cloud e Implementação de Aplicação

## Descrição

Este projeto demonstra a implementação de uma infraestrutura cloud na AWS utilizando Terraform como ferramenta de Infrastructure as Code (IaC).

A solução inclui a criação e configuração automática de uma infraestrutura composta por uma instância Amazon EC2, uma base de dados Amazon RDS PostgreSQL, uma fila Amazon SQS, uma VPC personalizada e respetivos mecanismos de segurança.

A aplicação desenvolvida em Node.js encontra-se contentorizada com Docker e é implementada automaticamente através de GitHub Actions e GitHub Container Registry (GHCR).

---

## Arquitetura da Solução

A infraestrutura é composta pelos seguintes componentes:

### Rede

- VPC dedicada
- Subnet pública para a instância EC2
- Duas subnets privadas para a base de dados RDS
- Internet Gateway
- Route Tables
- Security Groups

### Computação

- Amazon EC2 (t3.micro)
- Aplicação Node.js executada em Docker

### Base de Dados

- Amazon RDS PostgreSQL 17.5
- Implementação em subnets privadas
- Ligações protegidas por SSL

### Mensageria

- Amazon SQS

### Integração e Entrega Contínua

- GitHub Actions
- GitHub Container Registry (GHCR)

---

## Infraestrutura Provisionada

Os seguintes recursos são criados automaticamente através do Terraform:

| Recurso | Finalidade |
|----------|------------|
| VPC | Rede isolada da solução |
| Public Subnet | Alojamento da instância EC2 |
| Private Subnets | Alojamento da base de dados RDS |
| Internet Gateway | Acesso à Internet |
| Route Tables | Gestão de rotas |
| Security Groups | Controlo de acessos |
| EC2 | Execução da aplicação |
| RDS PostgreSQL | Armazenamento de dados |
| SQS | Sistema de filas |
| S3 Backend | Armazenamento do estado do Terraform |
| DynamoDB | Bloqueio do estado do Terraform |

---

## Aplicação

A API foi desenvolvida utilizando:

- Node.js
- Express.js
- PostgreSQL
- Docker

### Endpoints Disponíveis

#### Obter Practices

```http
GET /practices
```

Exemplo de resposta:

```json
[
  {
    "id": 1,
    "name": "Project Management"
  },
  {
    "id": 2,
    "name": "Quality Assurance"
  }
]
```

#### Obter Tools

```http
GET /tools
```

Exemplo de resposta:

```json
[
  {
    "id": 1,
    "name": "Jira"
  },
  {
    "id": 2,
    "name": "Confluence"
  }
]
```

#### Obter Assessments

```http
GET /assessments
```

Exemplo de resposta:

```json
[
  {
    "id": 1,
    "name": "Assessment A"
  },
  {
    "id": 2,
    "name": "Assessment B"
  }
]
```

---

## Estrutura da Base de Dados

### Practices

```sql
CREATE TABLE practices (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```

### Tools

```sql
CREATE TABLE tools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```

### Assessments

```sql
CREATE TABLE assessments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```

---

## Deploy da Infraestrutura

Inicializar Terraform:

```bash
terraform init
```

Validar configuração:

```bash
terraform validate
```

Visualizar alterações:

```bash
terraform plan
```

Criar infraestrutura:

```bash
terraform apply
```

---

## Deploy da Aplicação

Construir a imagem Docker:

```bash
docker build -t project-aws .
```

Executar a aplicação:

```bash
docker run -p 3000:3000 project-aws
```

---

## Pipeline CI/CD

O projeto utiliza GitHub Actions para automatizar o processo de build e deploy.

### Build

1. Obtenção do código do repositório.
2. Construção da imagem Docker.
3. Publicação da imagem no GitHub Container Registry.

### Deploy

1. Ligação à instância EC2 via SSH.
2. Remoção da versão anterior da aplicação.
3. Download da imagem mais recente.
4. Arranque automático do novo contentor.

---

## Segurança

Foram implementadas as seguintes medidas de segurança:

- Base de dados em subnets privadas.
- Security Groups para controlo de acessos.
- Autenticação SSH através de chave privada.
- Comunicação SSL entre a aplicação e o PostgreSQL.
- Estado do Terraform armazenado em S3.
- Bloqueio de alterações concorrentes através de DynamoDB.

---

## Tecnologias Utilizadas

- Amazon Web Services (AWS)
- Amazon EC2
- Amazon RDS PostgreSQL
- Amazon SQS
- Amazon VPC
- Terraform
- Docker
- GitHub Actions
- GitHub Container Registry (GHCR)
- Node.js
- Express.js
- PostgreSQL

---

## Autores

- Afonso Carrapico
- Jéssica Pires

---

## Objetivo

O objetivo deste projeto foi demonstrar a implementação de uma infraestrutura cloud recorrendo a Infrastructure as Code, contentorização e automação de deployment, utilizando serviços geridos da AWS e boas práticas de DevOps.
