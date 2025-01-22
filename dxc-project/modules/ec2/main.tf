resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id    = var.subnet_id

  tags = {
    Name = "my-ec2-instance"
  }
}
