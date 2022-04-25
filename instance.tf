resource "aws_instance" "logstash" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  subnet_id              = data.aws_subnet.logstach.id
  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  key_name               = var.my_keypair
  count                  = var.number_of_instances
  tags = {
    Name = "Logstach_server_${count.index + 1}"
  }
}
