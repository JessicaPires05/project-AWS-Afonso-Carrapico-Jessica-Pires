terraform {
  backend "s3" {
    bucket         = "project-aws-afonso-jessica"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project-aws"
    encrypt        = true
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_1_cidr = "10.0.1.0/24"
  public_subnet_2_cidr = "10.0.2.0/24"

  private_subnet_1_cidr = "10.0.3.0/24"
  private_subnet_2_cidr = "10.0.4.0/24"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = data.aws_ami.amazon_linux.id
  instance_type     = "t3.micro"
  key_name          = "project-aws-key"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id              = module.vpc.vpc_id
  security_group_name = "project-aws-dev-ssh"
}

module "rds" {
  source = "./modules/rds"

  db_identifier = "project-aws-db"
  db_name       = "projectdb"
  db_username   = "postgres"
  db_password   = var.db_password

  private_subnet_1_id = module.vpc.private_subnet_1_id
  private_subnet_2_id = module.vpc.private_subnet_2_id

  security_group_id = module.security_group.security_group_id
}

module "sqs" {
  source = "./modules/sqs"

  queue_name = "project-aws-queue"
}
