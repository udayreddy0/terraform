provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "instance" {
    ami = "ami-02d3770deb1c746ec"
    instance_type = var.instance_type
    key_name = var.keypair
    count = length(var.tag_name)
  tags = {
    Name = var.tag_name[count.index]
  }
}