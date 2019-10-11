variable "region" {
  default = "us-east-1"
}

variable "subnets" {
  default = [
    {
      cidr_range = "10.0.1.0/24"
      az         = "use1-az2"
      public_ip  = true
      name       = "public_subnet1"
    },
    {
      cidr_range = "10.0.2.0/24"
      az         = "use1-az4"
      public_ip  = false,
      name       = "private_subnet1"
    },
    {
      cidr_range = "10.0.3.0/24"
      az         = "use1-az6"
      public_ip  = true
      name       = "public_subnet2"
    }
  ]
}
