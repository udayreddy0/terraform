terraform {
backend "s3" {
    bucket = "wsbucketday5"
    region = "us-west-2"
    key = "region/terraform.tfstate"
    
}
}