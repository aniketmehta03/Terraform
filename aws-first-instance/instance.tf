data "aws_ami" "ec2-user" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20250414.0-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.ec2-user.id

}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.ec2-user.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.first-key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }

  user_data = file("${path.module}/script.sh")

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "readme.md"
    destination = "/tmp/readme.md"

  }

  provisioner "file" {
    content     = "this is a file"
    destination = "/tmp/content.md"

  }

  provisioner "local-exec" {
    working_dir = "/tmp"
    command     = "echo ${self.public_ip}>mypublicip.txt"
  }
}