resource "aws_sqs_queue" "main" {
  name = var.queue_name

  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600

  tags = {
    Name        = var.queue_name
    Project     = "project-aws"
    Environment = "dev"
    Owner       = "afonso-jessica"
    ManagedBy   = "terraform"
  }
}