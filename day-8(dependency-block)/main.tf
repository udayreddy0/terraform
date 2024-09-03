resource "aws_instance" "dependent" {
    ami = "ami-02d3770deb1c746ec"
    instance_type = "t2.micro"
    key_name = "ter"
    depends_on = [ aws_s3_bucket.dependent ]
}

resource "aws_s3_bucket" "dependent" {
    bucket = "qwerewqrewq"
}