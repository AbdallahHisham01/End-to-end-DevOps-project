variable "sg_k8s" {}
variable "sg_bastion" {}
variable "sg_jenkins" {}
variable "standby_priv_subnet_id" {}
variable "main_priv_subnet_id" {}
variable "ami" {
    default = "ami-084568db4383264d4"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "key" {
  default = "abdallah"
}
variable "main_subnet_id" {}