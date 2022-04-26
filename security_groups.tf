resource "aws_security_group" "logstash_sg" {
  vpc_id = data.aws_vpc.main_vpc.id
  ingress {
    description = "ingress rules"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    description = "ingress rules"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5043
    protocol    = "tcp"
    to_port     = 5044
  }
  egress {
    description = "egress rules"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "logstash_sg"
  }
}
