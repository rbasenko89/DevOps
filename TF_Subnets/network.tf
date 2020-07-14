resource "aws_vpc" "vpc_test" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"

    tags = {
        Name = "vpc_main"
        Author = "Ramella Basenko"
    }

}

resource "aws_subnet" "vpc_subnet_1"{
    vpc_id = aws_vpc.vpc_test.id 
    cidr_block = "10.0.0.0/27"
    availability_zone = "${var.region}a"

    tags = {
        Name = "vpc_subnet_1"
    }

}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.vpc_test.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "route_table_temporary"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.vpc_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "vpc_subnet_2"{
    vpc_id = aws_vpc.vpc_test.id 
    cidr_block = "10.0.0.0/29"
    availability_zone = "${var.region}a"

    tags = {
        Name = "vpc_subnet_2"
    }

}
resource "aws_internet_gateway" "private" {
  vpc_id = aws_vpc.vpc_test.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.private.id
  }

  tags = {
    Name = "route_table_temporary"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.vpc_subnet_2.id
  route_table_id = aws_route_table.private.id
}