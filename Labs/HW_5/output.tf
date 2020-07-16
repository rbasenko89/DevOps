output "instance_ec2-0_igw_ip" {
  value = aws_instance.ec2-0.public_ip
}

output "instance_ec2-1_igw_ip" {
  value = aws_instance.ec2-1.public_ip
}

output "instance_ec2-2_nat_ip" {
  value = aws_eip.eip.public_ip
}


output "instance_ec2-0-ip_addr" {
  value = aws_instance.ec2-0.private_ip
}

output "instance_ec2-1-ip_addr" {
  value = aws_instance.ec2-1.private_ip
}

output "instance_ec2-2-ip_addr" {
  value = aws_instance.ec2-2.private_ip
}
