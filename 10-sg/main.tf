module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/lakshmipriyanka96/terraform_aws_sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "Created for ${var.sg_names[count.index]}"
  vpc_id =  local.vpc_id
}