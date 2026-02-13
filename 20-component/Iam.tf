# ##Attach Role to EC2 
resource "aws_instance" "Private_EC2" {
  
  ami                         = local.ami_id
  instance_type               = var.ec2_instance_type

  subnet_id = local.private_subnet_list
  vpc_security_group_ids      = [local.sg_ids]
  # associate_public_ip_address = false
   user_data = file("${path.module}/user.sh")
   

   iam_instance_profile = aws_iam_instance_profile.prof1.name

  tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}"
      }
    )
 }


### Create IAM policy
resource "aws_iam_policy" "Pol1" {
  name        = "Pol1"
  description = "Permissions for EC2"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: "ec2:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    })
}

### Create IAM role
resource "aws_iam_role" "Rol1" {
  name = "Rol1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "examplerole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

### Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "polAttach" {
  name       = "Polattch"
  roles      = [aws_iam_role.Rol1.name]
  policy_arn = aws_iam_policy.Pol1.arn
}

### Create instance profile using role
resource "aws_iam_instance_profile" "prof1" {
  name = "Prof1"
  role = aws_iam_role.Rol1.name
}