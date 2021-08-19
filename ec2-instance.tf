resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amznlinux2.id
  #instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #for list
  instance_type = var.instance_type_map["qa"] #map
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id]
  for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offering.my_inst_type: az => details.instance_type if(details.instance_type) !=0)})
  availability_zone = each.key #list of items. 
  tags = {
    "Name" = "gopal-ec2-${each.key}"
  }
}