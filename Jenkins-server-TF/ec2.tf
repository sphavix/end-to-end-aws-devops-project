resource "aws_instance" "ec2" {
  ami                    = "ami-0df45fbfd315ec7bd"
  instance_type          = "t2.2xlarge"
  key_name               = ""
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name
  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./tools-install.sh", {})

  tags = {
    Name = var.instance-name
  }
}