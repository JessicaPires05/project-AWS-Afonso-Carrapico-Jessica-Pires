# Processo de Deployment

## Deployment da Infraestrutura

A infraestrutura é criada através do Terraform.

```bash
terraform init
terraform plan
terraform apply
```

## Build da Aplicação

Sempre que existe uma alteração no código da aplicação:

1. É efetuado um push para o GitHub.
2. O GitHub Actions executa o workflow de build.
3. A imagem Docker é criada.
4. A imagem é enviada para o GitHub Container Registry (GHCR).

## Deployment Automático

Após a criação da imagem:

1. O workflow de deploy liga-se à instância EC2.
2. O contentor existente é removido.
3. A imagem mais recente é descarregada.
4. Um novo contentor é iniciado.

## Fluxo de Deployment

```text
Developer
    |
    v
GitHub
    |
    v
GitHub Actions
    |
    v
Build Docker Image
    |
    v
GHCR
    |
    v
EC2
    |
    v
Application Running
```