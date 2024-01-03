terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
  profile = "default"  
}

resource "aws_instance" "app_server" {
  ami           = "ami-08e2c1a8d17c2fe17"
  instance_type = var.instance
  key_name = var.key

  tags = {
    Name = "environment"
  }
}

resource "aws_key_pair" "SSHkey" {
  key_name = var.key
  public_key = file("${var.key}.pub")
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}