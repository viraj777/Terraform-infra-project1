resource "aws_security_group" "allow_ports" {
  name        = "allow other ports"
  description = "Allow other ports "
  

  dynamic "ingress" {
    for_each = var.port
    iterator = port
    content {
       from_port        = port.value
       to_port          = port.value
       protocol         = "TCP"
       cidr_blocks = ["0.0.0.0/0"]

    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ports"
  }
}


resource "aws_security_group" "ansible_Jenkins" {
  name        = "allow ssh"
  description = "Allow ssh"
  

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    security_groups = [aws_security_group.allow_ports.id]
#    cidr_blocks = [aws_security_group.allow_ports.id]

    }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }


}


