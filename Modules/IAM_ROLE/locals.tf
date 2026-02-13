locals {
  private_subnet_list = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
}
locals {
  sg_ids = data.aws_ssm_parameter.vpc_sg_id[*].value
}