# Define the provider
provider "aws" {
  region = "us-east-1"  # Adjust to your region
}

# Create the S3 bucket for storing the Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-lock-bucket" # Replace with your desired unique bucket name
}

# Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-table" # Table name for locking
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}