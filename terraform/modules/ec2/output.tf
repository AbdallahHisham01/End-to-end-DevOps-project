output "master_id" {
  value = aws_instance.k8s[0].id
}
output "worker_id" {
  value = aws_instance.k8s[1].id
}

output "jenkins_id" {
  value = aws_instance.jenkins.id
}

output "standby_master_id" {
  value = aws_instance.standby[0].id
}

output "standby_worker_id" {
  value = aws_instance.standby[1].id
}