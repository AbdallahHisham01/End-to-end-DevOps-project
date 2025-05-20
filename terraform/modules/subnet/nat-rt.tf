resource "aws_route_table" "nat_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "nat_rt"
  }
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.nat_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

resource "aws_route_table_association" "nat_rt_main" {
  subnet_id      = aws_subnet.main_priv_subnet.id
  route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table_association" "nat_rt_sec" {
  subnet_id      = aws_subnet.standby_priv_subnet.id
  route_table_id = aws_route_table.nat_route_table.id
}