resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "Vpc Ud"
    }
}

resource "aws_subnet" "name" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.name.id
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id

}

resource "aws_route_table" "name" {
vpc_id = aws_vpc.name.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
}
}

resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.name.id
    subnet_id = aws_subnet.name.id
}

resource "aws_security_group" "allow_tls" {
name        = "allow_tls"
vpc_id = aws_vpc.name.id
tags = {
    Name = "dev_sg"
}
ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
}
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
}


}




resource "aws_instance" "name" {
    instance_type = var.instance_type
    ami = var.ami
    key_name = var.key_name
    tags = {
        Name = var.name
    }
}
