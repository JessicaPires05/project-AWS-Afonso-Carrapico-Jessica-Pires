resource "aws_db_instance" "postgres" {
  identifier = var.db_identifier

  engine         = "postgres"
  engine_version = "17.5"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  publicly_accessible = false

  skip_final_snapshot = true

  tags = {
    Name        = var.db_identifier
    Project     = "project-aws"
    Environment = "dev"
    Owner       = "afonso-jessica"
    ManagedBy   = "terraform"
  }
}