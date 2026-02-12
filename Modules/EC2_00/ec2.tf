resource "aws_instance" "pV_ec2" {
  ami                         = "ami-0b6524a0578a763e9"
  instance_type               = "t3.large"
  subnet_id                   = "subnet-080bd72bfff8dba83"
  vpc_security_group_ids      = ["sg-06b726f431e23ec38","sg-0b048e97fe024f887"]
  associate_public_ip_address = false

  user_data_replace_on_change = true

  tags = {
    Name = "Private-EC2"
  }
}
  
