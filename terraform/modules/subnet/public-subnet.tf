resource "aws_subnet" "main_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.main_az
}

resource "aws_subnet" "standby_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.sec_az
}