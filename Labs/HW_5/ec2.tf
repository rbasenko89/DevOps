data "aws_ami" "aws_linux" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "image-id"
    values = ["ami-0693ba315aa63cf93"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}


resource "aws_instance" "ec2-0" {
  ami           = "${data.aws_ami.aws_linux.id}"
  instance_type = "t2.micro"
  subnet_id               =  "${aws_subnet.public.id}"
  associate_public_ip_address = "true"
  key_name = "${aws_key_pair.ec2key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "ec2-0"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_instance" "ec2-1" {
  ami           = "${data.aws_ami.aws_linux.id}"
  instance_type = "t2.micro"
  subnet_id               =  "${aws_subnet.public.id}"
  associate_public_ip_address = "true"
  key_name = "${aws_key_pair.ec2key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  
  tags = {
    Name = "ec2-1"
  }

  depends_on = [aws_internet_gateway.igw]
}



resource "aws_instance" "ec2-2" {
  ami           = "${data.aws_ami.aws_linux.id}"
  instance_type = "t2.micro"
  subnet_id	= "${aws_subnet.private.id}"
  key_name      = "${aws_key_pair.ec2key.key_name}"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "ec2-2"
  }

  depends_on = [aws_nat_gateway.ngw]
}