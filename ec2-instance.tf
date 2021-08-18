#Terrform Setting Block
terraform {
  required_providers {
      source = "hashicorp/aws"
  }
}

#Provider Block
provide "aws"{
    profile = "default"
    reqion = ""
}


#Resource Block
resource "aws_instance" "ec2demo"{
    ami = 
    instance_type = "t2.micro"
}