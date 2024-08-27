

# Data Source for Availability Zones
data "aws_availability_zones" "available" {}

# VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Internet Gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Route Table
resource "aws_route_table" "example_route_table" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
}

# Associate Route Table with Subnets
resource "aws_route_table_association" "example_rta" {
  count      = length(aws_subnet.example_subnet)
  subnet_id  = aws_subnet.example_subnet[count.index].id
  route_table_id = aws_route_table.example_route_table.id
}

# Subnets
resource "aws_subnet" "example_subnet" {
  count = 2
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = "10.0.${count.index + 1}.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
}

# Application Load Balancer
resource "aws_lb" "example_alb" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.example_subnet[*].id

  enable_deletion_protection = false
  idle_timeout               = 60

  enable_http2 = true
  enable_cross_zone_load_balancing = true
}

# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  vpc_id      = aws_vpc.example_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
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
