 terraform {
  backend "s3" {
     bucket         = "priiy78"
    key            = "SG/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-lock-table"
     encrypt        = true
  }
 }