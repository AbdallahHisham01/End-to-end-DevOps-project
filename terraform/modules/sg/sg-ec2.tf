resource "aws_security_group" "k8s_sg" {
  name   = "ec2_sg"
  vpc_id = var.vpc_id

  ingress {
    description      = "allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "allow kubeapi"
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "allow jenkins"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

    ingress {
    description      = "allow 3001"
    from_port        = 3001
    to_port          = 3001
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "allow icmp"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = [var.vpc_cidr]
  }

  egress {
    description      = "allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}