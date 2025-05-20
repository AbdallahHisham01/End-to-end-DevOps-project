resource "aws_subnet" "main_priv_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.main_az
}

resource "aws_subnet" "standby_priv_subnet" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.sec_az
}