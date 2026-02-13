# variable "vpc_cidr" {
#     default = "10.0.0.0/16"
# }

# variable "project_name" {
#     default = "EISAI"
# }

# variable "environment"{
#     default = "dev"
# }

# variable "vpc_tags" {
#     default = {
#         Purpose = "EISAI VPC"
#         DontDelete = "true"
#     }
# }

# variable "public_subnet_cidrs" {
#     default= ["10.0.1.0/24","10.0.2.0/24"]
# }

# variable "private_subnet_cidrs" {
#     default= ["10.0.11.0/24","10.0.12.0/24"]
# }

# variable "database_subnet_cidrs" {
#     default= ["10.0.21.0/24","10.0.22.0/24"]
# }


#################################################
# Project Information
#################################################

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/prod)"
  type        = string
}

#################################################
# VPC Configuration
#################################################

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags to apply to VPC"
  type        = map(string)
}

#################################################
# Subnet Configuration
#################################################

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}
