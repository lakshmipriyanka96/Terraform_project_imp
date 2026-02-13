terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.16"
    }
  }

  backend "s3" {
    bucket         = "eisai12"                     # Must be lowercase (S3 rule)
    key            = "EISAISG/terraform.tfstate"   # Proper state file path
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true                          # Enables state locking (Terraform 1.5+)
  }
}

provider "aws" {
  region = "us-east-1"
}
