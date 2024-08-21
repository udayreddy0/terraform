resource "aws_instance" "name" {
    ami = "ami-0c0493bbac867d427"
    instance_type = "t2.micro"
    key_name = "udi"
    
}