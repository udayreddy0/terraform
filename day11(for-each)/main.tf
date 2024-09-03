provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "instance" {
    ami = "ami-02d3770deb1c746ec"
    instance_type = var.instance_type
    key_name = var.keypair
    for_each = toset(var.tag_name)
  tags = {
    Name = each.value
  }
}