provider "aws" {
    region = "us-west-2"
    alias = "central"

}
provider "aws" {
    region = "ap-south-1"
    alias = "south"

}
resource "aws_s3_bucket" "central" {
    bucket = "udayyyreddbuc"
    provider = aws.central

}
resource "aws_s3_bucket" "south" {
    bucket = "vamsikrishbuc"
    provider =aws.south
}