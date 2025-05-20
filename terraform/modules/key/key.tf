resource "aws_key_pair" "ec2" {
  key_name = "abdallah"
  public_key = file("/home/abdallah/.ssh/id_rsa.pub")
}