provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "instance" {
    ami= "ami-02d3770deb1c746ec"
    instance_type = "t2.micro"
    key_name   = "ter"
    user_data = file("test.sh")
}