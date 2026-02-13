data "aws_ssm_parameter" "private_subnet_ids" {
     name ="/${var.project}/${var.environment}/private_subnet_ids"
 }
data "aws_ssm_parameter" "vpc_sg_id" {
    count = length(var.sg_names)
 name ="/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
} 