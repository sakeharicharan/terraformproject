provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-00af95fa354fdb788"
  instance_type          = "t3.micro"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-06f5dea461aa96704"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
