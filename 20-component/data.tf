data "aws_ssm_parameter" "private_subnet_ids" {
     name ="/${var.project}/${var.environment}/private_subnet_ids"
 }

data "aws_ssm_parameter" "vpc_sg_id" {
    count = length(var.sg_names)
 name ="/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
} 


data "aws_ami" "ami" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}