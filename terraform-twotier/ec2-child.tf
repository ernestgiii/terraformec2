resource "aws_instance" "apache-server" {
  ami           = var.ami_in
  instance_type = var.instance_type
  count         = var.public_subnet_number

  user_data = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Own by Black N Tech Media </h1> /var/www/html/index.html" #bash script for apache
     EOF

  tags = {
    Name = "Apache-prod"
  }
}