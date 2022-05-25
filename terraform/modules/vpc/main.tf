resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support= true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "main-subnet-public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_range
  availability_zone = var.aws_availability_zone
  tags = {
    Name = var.vpc_subnet_name
  }
}

resource "aws_internet_gateway" "main-igw" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = "main-igw"
    }
}

resource "aws_route_table" "main-public-crt" {
    vpc_id = "${aws_vpc.main.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.main-igw.id}" 
    }
    
    tags = {
        Name = "main-public-crt"
    }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = "${aws_subnet.main-subnet-public.id}"
    route_table_id = "${aws_route_table.main-public-crt.id}"
}


