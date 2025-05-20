output "main_subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "standby_subnet_id" {
  value = aws_subnet.standby_subnet.id
}
output "main_priv_subnet_id" {
  value = aws_subnet.main_priv_subnet.id
}

output "standby_priv_subnet_id" {
  value = aws_subnet.standby_priv_subnet.id
}