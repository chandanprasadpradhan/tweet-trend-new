provider "aws" {
region  = "us-east-1"
}
 resource "aws_instance" "demo-server" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name      = "ddp"
  security_groups = ["demo-sg"]
 }  
 resource "aws_security_group" "demo_sg" {
  name        = "demo-sg"
  description = "SSH Access"
  

  # Inbound rules
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # This means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-prot"
  }
}