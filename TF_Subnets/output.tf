output "instance_ec2-1_igw_ip" {
  value = aws_instance.EC2-1.public_ip
}

output "instance_ec2-2_nat_ip" {
  value = aws_eip.eip.public_ip
}

output "instance_ec2-1-ip_addr" {
  value = aws_instance.EC2-1.private_ip
}

output "instance_ec2-2-ip_addr" {
  value = aws_instance.EC2-2.private_ip
}