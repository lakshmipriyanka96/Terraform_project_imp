resource "aws_s3_bucket" "cs3" {
bucket = var.bucket_name
tags = merge(
    var.common_tags,
    {
      Name = "My-bucket"
      bucket = true  
    }
)
}
resource "aws_s3_bucket_versioning" "V1" {
  bucket = aws_s3_bucket.cs3.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "Dblock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
