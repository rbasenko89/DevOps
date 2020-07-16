resource "null_resource" "copy-keys-instcane-0" {
  depends_on = [aws_instance.ec2-1]

  provisioner "local-exec" {
   command ="sleep 60 && ssh -o StrictHostKeyChecking=no ubuntu@${aws_instance.ec2-0.public_ip} && scp -i id_rsa id_rsa* ubuntu@${aws_instance.ec2-0.public_ip}:~/"
  }
}

resource "null_resource" "copy-keys-instcane-1" {
  depends_on = [aws_instance.ec2-1]

  provisioner "local-exec" {
   command ="sleep 60 && ssh -o StrictHostKeyChecking=no ubuntu@${aws_instance.ec2-1.public_ip} && scp -i id_rsa id_rsa* ubuntu@${aws_instance.ec2-1.public_ip}:~/"
  }
}