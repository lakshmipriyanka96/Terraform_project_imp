variable "bucket_name" {
    type = string
    default = "eisai12"
}


variable "common_tags" {
    type = map
    default = {
     Environment = "dev"
     Project = "Terraform"
    }
}