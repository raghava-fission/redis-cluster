output "instances" {
  value = aws_instance.instances.*.public_ip
}


output "subnetid" {
  value = var.aws_subnet_id
}

