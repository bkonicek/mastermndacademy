provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "mastermnd-ansible-control" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "mastermnd"
  tags = {
    Name = "Ansible control server"
  }
}

resource "aws_instance" "mastermnd-ansible-inventory1" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "mastermnd"
  tags = {
    Name = "Ansible inventory 1"
  }
}

resource "aws_instance" "mastermnd-ansible-inventory2" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "mastermnd"
  tags = {
    Name = "Ansible inventory 2"
  }
}