resource "aws_internet_gateway" "main_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "main_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  route {
     cidr_block = "10.0.0.0/16"
     gateway_id = "local"
  }

  tags = {
    Name = "main_rt"
  }
}

resource "aws_route_table_association" "main_rt_assoc" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "sec_rt_assoc" {
  subnet_id      = aws_subnet.standby_subnet.id
  route_table_id = aws_route_table.main_rt.id
}