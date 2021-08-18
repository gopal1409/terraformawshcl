variable "aws_region" {
        description = "Region in which aws resource to be created"
        type = string
        default = "us-east-1"
}

variable "instance_type" {
    description = "ec2 isntance type"
    type = string
    default = "t3.micro"
}