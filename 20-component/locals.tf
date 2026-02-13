locals {
  ami_id = data.aws_ami.ami.id
  sg_ids = data.aws_ssm_parameter.vpc_sg_id[0].value
  private_subnet_list = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  common_name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Terraform = "true"
  }
}
