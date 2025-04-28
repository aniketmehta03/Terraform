resource "aws_instance" "web" {
  ami           = "ami-091dccf4e2d272bae"
  instance_type = "t2.micro"

  tags = {
    Name = "first-tf-instance"
  }
}