resource "aws_instance" "logstash" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  key_name               = var.my_keypair
  #count                  = var.number_of_instances
  tags = {
    Name = "Logstash_server" #_${count.index + 1}"
  }
}


resource "aws_volume_attachment" "ebs_attch" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_logstash.id
  instance_id = aws_instance.logstash.id
}

resource "aws_ebs_volume" "ebs_logstash" {
  #  most_recent = true
  availability_zone = "us-east-1a"
  size              = 50

  tags = {
    Name = "EBSLOGSTACH"
  }
}

#resource "aws_instance" "logstash" {
#  ami               = "ami-04505e74c0741db8d"
#  availability_zone = "us-east-1a"
#  instance_type     = "t3.medium"
#  subnet_id         = "subnet-016f9d737ca8fd32e"

#  tags = {
#    Name = "Logstach EBS Server"
#  }
#}