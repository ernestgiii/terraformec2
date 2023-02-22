# *** network/main.tf ****

resource "aws_vpc" "prod_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "prod-vpc"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "prod_subnets" {
  count                   = var.subnet_number
  vpc_id                  = aws_vpc.prod_vpc.id
  cidr_block              = ["10.10.6.0/24", "10.10.8.0/24", "10.10.3.0/24", "10.10.5.0/24"][count.index]
  map_public_ip_on_launch = count.index < 2
  availability_zone       = ["us-east-1a", "us-east-1b"][count.index % 2]

  tags = {
    Name = "prod-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "prod_internet_gateway" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "breezy_int_gateway"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "prod_pub_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.pub_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.prod_internet_gateway.id
}

resource "aws_route_table_association" "prod_public_assoc" {
  count          = 2
  subnet_id      = aws_subnet.my_subnets.*.id[count.index]
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_default_route_table" "prod_private_rt" {
  default_route_table_id = aws_vpc.prod_vpc.default_route_table_id

  tags = {
    Name = "prod_private"
  }
}

resource "aws_db_subnet_group" "prod_rds_subnetgroup" {
  name       = "prod_rds_subnetgroup"
  subnet_ids = slice(aws_subnet.my_subnets.*.id, 2, 4)

  tags = {
    Name = "prod_rds_sg"
  }
}
