  output "Iam_id" {
      value = aws_iam_policy.Pol1.id
  }
  output "Iam_Role" {
      value = aws_iam_role.Rol1.id
  }

  output "PolicyAttach" {      
   value = aws_iam_policy_attachment.polAttach.id
  }