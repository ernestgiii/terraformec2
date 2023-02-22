module "ec2_instance" {
  ami_id               = var.ami_id
  public_subnet_number = var.public_subnet_number
  source               = "./child-resources"
  instance_type        = var.instance_type
  sg_group_in          = [module.sg.breezy_sg_in]
  subnet_id            = module.networks.subnet_id
}

module "rds_sg" {
  source     = "./child-resources"
  vpc_id     = var.networks.vpc_id
  cidr_block = var.cidr_block
}

module "networks" {
  subnet_number = var.public_subnet_number + var.private_subnet_number
  source        = "./child-resources"
  cidr_block    = var.cidr_block
}

module "rds" {
  source                     = "./child-resources"
  db_storage                 = var.db_storage
  db_engine_version          = var.db_engine_version
  db_instance_class          = var.db_instance_class
  dbname                     = var.dbname
  dbuser                     = var.dbuser
  dbpass                     = var.dbpass
  db_subnet_group_name       = var.db_subnet_group_name #Optional argument
  private_security_group_ids = module.sg.rds_sg_ids
  db_identifier              = var.db_identifier
  skip_db_snapshot           = var.skip_db_snapshot
}