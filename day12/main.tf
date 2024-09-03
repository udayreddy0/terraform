resource "aws_s3_bucket" "name" {
  bucket   = "tollwood-ka-raj-prabash123"
  provider = aws.default
}

resource "aws_s3_bucket" "vc" {
  bucket   = "king-of-tollywood-is-prabash123"
  provider = aws.account2
}
