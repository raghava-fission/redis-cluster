output "vpcid" {
  value= module.redis-vpc.vpc_id
}

output "vpccidr" {
  value= module.redis-vpc.vpc_cir
}

# output "instanceips" {
#   value = module.ec2instances.*.public_ip
# }