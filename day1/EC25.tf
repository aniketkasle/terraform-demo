resource "aws_key_pair" "terraform_kay_pair01" {

    key_name = "terraform-project-key-01"
    public_key = file("C:/Users/anike/.ssh/id_rsa.pub")
  
}

#default vpc

resource "aws_default_vpc" "default10" {
  
}

resource "aws_security_group" "infra-sap-nl-prod" {

    name = "infra-sap-nl-prod-sg"
    vpc_id = aws_default_vpc.default.id

    ingress{

        from_port = 22
        to_port = 22
        protocol = "tcp"
        description = "allow port 22"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {

        from_port = 22
        to_port = 22
        protocol = "http"
        description = "allow port 443"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
  
}

resource "aws_instance" "example-test" {

 ami = "ami-03fd334507439f4d1"
    instance_type = "t2.micro"
    key_name = aws_key_pair.terraform-key.key_name
    security_groups = [aws_security_group.infra-ineo-noprod.name]
    tags = {
      name = "terra-ineo-noprod-automate"
    } 
}