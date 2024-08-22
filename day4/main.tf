resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Vpc Ud"
  }
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.name.id
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.name.id
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
}

resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id  # Referencing public subnet

  tags = {
    Name = "NatGateway"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.name.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private.id  # Correct reference to private subnet
}

resource "aws_security_group" "allow_tls" {
  name   = "allow_tls"
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "dev_sg"
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "name" {
  instance_type = var.instance_type
  ami           = var.ami
  key_name      = var.key_name
  tags = {
    Name = var.name
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

