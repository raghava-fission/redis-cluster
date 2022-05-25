output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cir" {
  value = aws_vpc.main.cidr_block
}

output "subnet_id" {
  value = aws_subnet.main-subnet-public.id
}

output "subnet_cir" {
  value = aws_subnet.main-subnet-public.cidr_block
}