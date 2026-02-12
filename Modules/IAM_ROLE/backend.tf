 terraform {
   backend "s3" {
     bucket         = "eisai12"
    key            = "IAM/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
     encrypt        = true
  }
}