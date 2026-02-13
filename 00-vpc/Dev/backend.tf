terraform {
  backend "s3" {
    bucket         = "lakshmi-terraform-state"
    key            = "00-vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
