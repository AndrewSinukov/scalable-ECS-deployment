terraform {
  backend "s3" {
    bucket         = "app-api-devops-tfstate"
    key            = "recipe-app.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "app-api-devops-tf-state-lock"
  }
}

provider "aws" {
  region = "us-east-1"
  version = "~> 2.50.0"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project = var.project
    Owner = var.contact
    ManageBy = "Terraform"
  }
}

data "aws_region" "current" {}
