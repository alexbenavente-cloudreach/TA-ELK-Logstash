#EBS VOLUME AND ATTACHMENT

resource "aws_volume_attachment" "ebs_attch" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_logstach.id
  instance_id = aws_instance.logstach.id
}


resource "aws_ebs_volume" "ebs_logstach" {
  availability_zone = "us-east-1a"
  size              = 50

  tags = {
    Name = "EBSLOGSTACH"
  }
}

resource "aws_instance" "logstach" {
  ami               = "ami-21f78e11"
  availability_zone = "us-east-1a"
  instance_type     = "t3.medium"

  tags = {
    Name = "Reslogstachaws"
  }
}






