provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "name" {
  ami           ="ami-02d3770deb1c746ec"
  instance_type = var.instance_type
  count         = var.instance_type == "t2.nano" ? 1 : 0
  tags = {
    Name = "dev_server"
  }
}