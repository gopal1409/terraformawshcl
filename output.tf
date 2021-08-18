#terraform output values
#ec2 instance pulbic ip

output "instance_publicip" {
  description = "Ec2 instance public ip"
  value = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
  description = "Ec2 instance public dns"
  value = aws_instance.myec2vm.public_dns
}