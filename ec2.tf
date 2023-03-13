resource "aws_instance" "web" {
  for_each = local.services
  ami           = each.key == "node2" ? data.aws_ami.AL2.id : data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = each.key == "Ansible-controller" ? [aws_security_group.ansible_Jenkins.id] : [aws_security_group.allow_ports.id]

  tags = {
    Name = each.key
  }

  user_data = each.value
}

