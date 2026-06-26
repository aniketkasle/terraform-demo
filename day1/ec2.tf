resource "aws_key_pair" "terraform-key" {

    key_name = "terraform-project-key01"
    public_key = file("C:/Users/anike/.ssh/id_rsa.pub")
  
}

# default vpc

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "infra-ineo-example" {
  
  name = "infra-ineo-shared-443"
  vpc_id = aws_default_vpc.default.id


  ingress{
    description = "allowing port"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    description = "allowing port"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {

    ami = "ami-03fd334507439f4d1"
    instance_type = "t2.micro"
    key_name = aws_key_pair.terraform-key.key_name
    security_groups = [aws_security_group.infra-ineo-example.name]
    tags = {
      name = "terra-ineo-automate"
    }
  
}