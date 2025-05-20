output "sg_k8s" {
  value = aws_security_group.k8s_sg.id
}

output "sg_elb" {
  value = aws_security_group.elb_sg.id
}

output "sg_bastion" {
  value = aws_security_group.bastion_sg.id
}

output "sg_jenkins" {
  value = aws_security_group.jenkins_sg.id
}