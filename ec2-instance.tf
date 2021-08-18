resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id]
  tags = {
    "Name" = "gopal-ec2"
  }
}