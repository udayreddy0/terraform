# IAM Role
resource "aws_iam_role" "example_role" {
  name = "example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Role Policy
resource "aws_iam_role_policy" "example_role_policy" {
  name   = "example-role-policy"
  role   = aws_iam_role.example_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:ListBucket",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "example-instance-profile"
  role = aws_iam_role.example_role.name
}

# EC2 Instance
resource "aws_instance" "example_instance" {
  ami           = "ami-02d3770deb1c746ec"  # Replace with your desired AMI
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.example_instance_profile.name

  tags = {
    Name = "example-instance"
  }
}









