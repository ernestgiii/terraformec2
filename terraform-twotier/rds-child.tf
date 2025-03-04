resource "aws_db_instance" "breezy_db" {
  allocated_storage      = var.db_storage
  engine                 = "mysql"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = var.dbname
  username               = var.dbuser
  password               = var.dbpass
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.private_security_group_ids
  identifier             = var.db_identifier
  skip_final_snapshot    = var.skip_db_snapshot

  tags = {
    Name = "breezy_db"
  }
}