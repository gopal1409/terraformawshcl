#Terrform Setting Block
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
    
  }
  backend "s3" {
  bucket = "terraform-state-gopal"
  key = "dev/terraform.tfstate"
  region = "ap-northeast-2"
  dynamodb_table = "gopal-ec2-project"
 }
}
#adding backend s3 bucket for remote state storage

#Provider Block
provider "aws"{
    profile = "default"
    region = var.aws_region
}
