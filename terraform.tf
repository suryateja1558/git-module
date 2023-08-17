terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Configuring provider
provider "aws" {
region = "us-east-1"
}


resource "aws_iam_role" "example_role" {
  name = "example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_instance" "example_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_role.example_role.name  # Attach the IAM role
  # Other instance configuration...

  user_data = <<-EOF
    #!/bin/bash
    # Your user data script
  EOF
}

