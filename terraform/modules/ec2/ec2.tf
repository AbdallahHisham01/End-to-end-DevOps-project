resource "aws_instance" "k8s" {
  count = 2
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main_priv_subnet_id
  vpc_security_group_ids = [ var.sg_k8s ]
  tags = {
    Name = count.index == 0 ? "Master" : "Worker"
  }
}

resource "aws_instance" "bastion" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main_subnet_id
  vpc_security_group_ids = [ var.sg_bastion ]
  associate_public_ip_address = true
  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "jenkins" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.main_priv_subnet_id
  vpc_security_group_ids = [ var.sg_jenkins ]
  tags = {
    Name = "Jenkins" 
  }
}

resource "aws_instance" "standby" {
  count = 2
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  subnet_id = var.standby_priv_subnet_id
  vpc_security_group_ids = [ var.sg_k8s ]
  tags = {
    Name = count.index == 0 ? "Master" : "Worker"
  }
}