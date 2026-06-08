# Limitações e Melhorias Futuras

## Limitações Atuais

A solução foi desenvolvida para fins académicos e apresenta algumas limitações:

- Apenas existe um ambiente de desenvolvimento.
- Utilização de uma única instância EC2.
- Não existe Load Balancer.
- Não existe Auto Scaling.
- Não existe monitorização avançada.
- Não existe recuperação automática em caso de falha da instância.

## Melhorias Futuras

Numa evolução futura do projeto poderão ser implementadas as seguintes melhorias.

### Escalabilidade

- Application Load Balancer (ALB)
- Auto Scaling Groups

### Observabilidade

- Amazon CloudWatch
- Dashboards de monitorização
- Alertas automáticos

### Segurança

- AWS Secrets Manager
- Certificados TLS geridos automaticamente
- IAM mais granular

### Plataforma

- Migração para Amazon ECS
- Migração para Kubernetes (EKS)

### Disponibilidade

- Implementação Multi-AZ
- Estratégias de Disaster Recovery
- Backups automáticos da base de dados