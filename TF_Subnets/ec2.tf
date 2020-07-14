data "aws_ami" "aws_linux" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "image-id"
    values = ["ami-0693ba315aa63cf93"]
  }
}

resource "aws_instance" "EC2-1" {
  for_each = var.subnet_numbers
  ami = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id = each.key
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "EC2-1"
  }

  depends_on = [aws_security_group.default]
}

resource "aws_instance" "EC2-2" {
  ami = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id = aws_subnet.vpc_subnet_1.id
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "EC2-2"
  }

  depends_on = [aws_security_group.default]
}

resource "aws_security_group" "default" {
  name = "default"
  description = "default security group(allow all)"
  vpc_id = aws_vpc.vpc_test.id

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    protocol = "icmp"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
