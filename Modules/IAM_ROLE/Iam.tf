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
# ##Attach Role to EC2 
resource "aws_instance" "private_ec2" {
  ami                         = "ami-0b6524a0578a763e9"
  instance_type               = "t3.large"
  subnet_id                   = "subnet-0147efed63654e1f9"
  vpc_security_group_ids      = aws_security_group.main.id

  associate_public_ip_address = false

   iam_instance_profile = aws_iam_instance_profile.prof1.name

  tags = {
    Name = "private-ec2"
  }
 }
