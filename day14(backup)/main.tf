provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "name" {
    ami = "ami-02d3770deb1c746ec"
    instance_type = "t2.nano"
    key_name = "ter"
    tags = {
      Name="aws"
    }
  
}