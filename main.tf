terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "Terraform"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
