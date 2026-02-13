# variable "region_name" {
#   description = "Region to create the resources"
#   type        = string
# }

variable "ec2_instance_type" {
  description = "Instance type to create the resources"
  type        = string
  
}

variable "project" {
  description = "Project name"
  type        = string
  default = "EISAI"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "sg_names" {
  type = list(string)
}