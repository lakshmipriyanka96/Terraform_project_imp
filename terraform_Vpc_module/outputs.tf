output "vpc_id" {
  value       = aws_vpc.main.id
}
 output "Igw_id" {
     value = aws_internet_gateway.main.id
}
  output "public_subnet_ids" {
    value = aws_subnet.public[*].id
 }
  output "private_subnet_ids" {
    value = aws_subnet.private[*].id
  }
  output "Nat_id" {
     value = aws_nat_gateway.nat.id
}