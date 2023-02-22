output "web_sg_id" {
  value = aws_security_group.breezy_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "vpc_id" {
  value = aws_vpc.prod_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.my_subnets.*.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.prod_rds_subnetgroup.name
}

