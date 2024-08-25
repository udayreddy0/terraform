resource "aws_instance" "name" {
    ami =var.ami
    instance_type =var.instance_type
    key_name =var.key_name
    tags = {
    Name = "ud"
    }

}

resource "aws_s3_bucket" "name" {
    bucket = "wsbucketday5"
}