provider "aws" {
   region = "ap-south-1"
} 

resource "aws_vpc" "vpc" {
     cidr_block = "10.0.0.0/16"
	  tags = {
	   Name = "terraform-vpc"
	  }
} 


resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}
resource "aws_instance" "my-instance" {
     subnet_id      = aws_subnet.publicsubnet.id
	 vpc_security_group_ids = [aws_security_group.sg.id]
     ami ="ami-06a0b4e3b7eb7a300"
	 instance_type = "t2.micro"
	 key_name = "terraform"
	 tags = {
	   Name = "terraform-new"
	   
	   }
}
