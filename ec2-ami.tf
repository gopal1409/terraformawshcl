data "aws_ami" "amznlinux2" {
    most_recent = true #the updated image
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*"]
    }
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["ebs"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }

}