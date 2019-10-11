provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_subnet" "subnet_create" {
  vpc_id                  = "vpc-0e1aa59b3623fbc0a"
  cidr_block              = "${var.subnets[count.index].cidr_range}"
  availability_zone_id    = "${var.subnets[count.index].az}"
  map_public_ip_on_launch = "${var.subnets[count.index].public_ip}"
  tags = {
    Name = "${var.subnets[count.index].name}"
  }
  count = "${length(var.subnets)}"
}
