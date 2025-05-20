module "vpc" {
  source = "./modules/vpc"
}

module "natgw" {
  source = "./modules/natgw"
  subnet_id = module.subnet.main_subnet_id
  vpc_id = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  nat_gateway_id = module.natgw.nat_gateway_id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
}

module "key" {
  source = "./modules/key"
}

module "ec2" {
  source = "./modules/ec2"
  main_priv_subnet_id = module.subnet.main_priv_subnet_id
  standby_priv_subnet_id = module.subnet.standby_priv_subnet_id
  sg_k8s = module.sg.sg_k8s
  sg_bastion = module.sg.sg_bastion
  sg_jenkins = module.sg.sg_jenkins
  main_subnet_id = module.subnet.main_subnet_id
}

module "elb" {
  source = "./modules/elb"
  sg_elb = module.sg.sg_elb
  standby_subnet_id = module.subnet.standby_subnet_id
  main_subnet_id = module.subnet.main_subnet_id
  jenkins_id = module.ec2.jenkins_id
  vpc_id = module.vpc.vpc_id
  standby_master_id = module.ec2.standby_master_id
  standby_worker_id = module.ec2.standby_worker_id
  master_id = module.ec2.master_id
  worker_id = module.ec2.worker_id

}