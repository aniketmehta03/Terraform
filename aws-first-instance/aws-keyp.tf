#creating ssh key
resource "aws_key_pair" "first-key" {
  key_name   = "first-key-terraform"
  public_key = file("${path.module}/id_rsa.pub")
}