#-----/main.tf*****

resource "aws_instance" "app_server1" {
  ami           = var.ami_id
  instance_type = var.instance

  tags = {
    Name = var.tag
  }
}