variable "ingress" {
  default = [
    {
      protocol  = "tcp"
      rule_no   = 100
      action    = "allow"
      from_port = 22
      to_port   = 22
    },
    {
      protocol  = "tcp"
      rule_no   = 110
      action    = "allow"
      from_port = 80
      to_port   = 80
    }
  ]
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}
