resource "aws_eip" "nat" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nagt_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet_id
}