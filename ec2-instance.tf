resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #for list
  instance_type = var.instance_type_map["qa"] #map
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id]
  count = 2
  tags = {
    "Name" = "gopal-ec2-${count.index}"
  }
}