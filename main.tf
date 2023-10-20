terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_default_region
}

# Configure ec2 instance
resource "aws_instance" "test"{
  ami = var.aws_ec2-ami
  key_name = var.aws_ec2_connection_key_name
  instance_type = var.aws_ec2_instance_type
  vpc_security_group_ids = [aws_security_group.ssh-sg.id, aws_security_group.http-allow.id]

  user_data = base64encode(templatefile("${path.module}/scripts/server.sh",{}))

  tags = {
    Name = "image with java 17"
  }
}