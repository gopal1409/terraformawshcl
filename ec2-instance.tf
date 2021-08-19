data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #for list
  instance_type = var.instance_type_map["qa"] #map
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id]
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key #list of items. 
  tags = {
    "Name" = "gopal-ec2-${each.value}"
  }
}