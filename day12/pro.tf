provider "aws" {
  profile = "default"
  alias   = "default"
  region  = "us-west-2"  # Replace with your preferred region
}

provider "aws" {
  profile = "account2"
  alias   = "account2"
  region  = "ap-south-1"  # Replace with your preferred region
}
