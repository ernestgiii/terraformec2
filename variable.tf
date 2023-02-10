# ec2 childmodle/variables.tf ***

variable "ami_id" {
  type    = string
  default = "ami-0aa7d40eeae50c9a9"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tag" {
  type    = string
  default = "Week21EC2"
}