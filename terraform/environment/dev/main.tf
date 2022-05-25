module "redis-vpc" {
    source = "../../modules/vpc"
    vpc_name= "redis-cluster-vpc"
    vpc_cidr= "172.30.10.0/24"
    vpc_subnet_name= "redis-public-subnet"
    subnet_cidr_range= "172.30.10.0/25"
    aws_region = "ap-south-1"
    aws_availability_zone = "ap-south-1a"
}

module "ec2instances" {
   source = "../../modules/ec2"
   availability_zone= var.availability_zone
   ami= "ami-0756a1c858554433e"
   aws_subnet_id="${module.redis-vpc.subnet_id}"
   ebs_vol_size="10"
   aws_instance_type="t2.micro"
   aws_sg = aws_security_group.main-redis-sg.id
   env="dev"
   os="Ubuntu"
}

resource "aws_security_group" "main-redis-sg" {
    vpc_id = "${module.redis-vpc.vpc_id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "redis-allowed"
    }
   }