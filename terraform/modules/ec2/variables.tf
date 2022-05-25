variable "availability_zone" {}

variable "ami" {}

#variable "aws_vpc" {}

variable "aws_subnet_id" {}

#assuming 3 nodes with 1  master
variable "aws_instance_names" {
    type = list(string)
    default = ["master","slave-1"]
}

variable "ebs_vol_size" {}

variable "aws_instance_type" {}

variable "aws_sg" {}

variable "env" { }

variable "os" {}

