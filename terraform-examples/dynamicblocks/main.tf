provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

}

resource "aws_subnet" "subnet" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.10.1.0/24"
}

resource "aws_network_acl" "vpc_acl" {
  vpc_id     = "${aws_vpc.vpc.id}"
  subnet_ids = ["${aws_subnet.subnet.id}"]
  dynamic "ingress" {
    for_each = var.ingress

    content {
      protocol   = "${ingress.value.protocol}"
      rule_no    = "${ingress.value.rule_no}"
      action     = "${ingress.value.action}"
      cidr_block = "${var.destination_cidr_block}"
      from_port  = "${ingress.value.from_port}"
      to_port    = "${ingress.value.to_port}"
    }
  }
}
