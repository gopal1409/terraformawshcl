#Terrform Setting Block
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}

#Provider Block
provider "aws"{
    profile = "default"
    region = var.aws_region
}
