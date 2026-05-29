terraform {
  backend "s3" {
    bucket         = "project-aws-afonso-jessica"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project-aws"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "project-aws-dev-vpc"
    Project     = "project-aws"
    Environment = "dev"
    Owner       = "afonso-jessica"
    ManagedBy   = "terraform"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    Name        = "project-aws-dev-ec2"
    Project     = "project-aws"
    Environment = "dev"
    Owner       = "afonso-jessica"
    ManagedBy   = "terraform"
  }
}