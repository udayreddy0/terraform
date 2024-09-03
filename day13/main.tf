# main.tf
provider "aws" {
  region = "us-west-2" # Replace with your preferred AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-bucket-name-1234345"  # Replace with a unique bucket name

  # Use the local-exec provisioner to run a local command after the bucket is created
  provisioner "local-exec" {
    command = "echo S3 bucket ${self.bucket} has been created successfully."
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}
