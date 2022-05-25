 resource "aws_instance" "instances" {
  count = "${length(var.aws_instance_names)}"  
  ami =  "${var.ami}"
  instance_type = "${var.aws_instance_type}"
  subnet_id = "${var.aws_subnet_id}"
  associate_public_ip_address = true
  security_groups = [ "${var.aws_sg}" ]
  key_name = "controller"
  
  root_block_device {
    delete_on_termination = true
    volume_size = "${var.ebs_vol_size}"
  }

  tags = {
    Name = "${element(var.aws_instance_names, count.index)}"
    Environment = "${var.env}"
    OS = "${var.os}"
  }
}