provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "mastermnd" {
  ami           = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"
  tags = {
    Name = "MastermndTerraform"
  }

}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.mastermnd.id
}
