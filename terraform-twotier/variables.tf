variable "ami_id" {
  type    = string
  default = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

# *** my db variables ***

variable "dbname" {
  type    = string
  default = "dbname"
}

variable "dbuser" {
  type      = string
  sensitive = true
  default   = "breezy"
}

variable "dbpass" {
  type      = string
  sensitive = true
  default   = "password"
}

variable "public_subnet_number" {
  type    = number
  default = 2
}

variable "private_subnet_number" {
  type    = number
  default = 2
}

variable "cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "db_storage" {
  type    = number
  default = 10
}

variable "db_identifier" {
  type    = string
  default = "breezy_db"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_engine_version" {
  type    = number
  default = 5.7
}

variable "skip_db_snapshot" {
  type    = string
  default = false
}