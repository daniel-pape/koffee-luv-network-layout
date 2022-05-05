data "aws_ami" "amazon_linux_latest" {
  owners      = ["137112412989"]
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "module" {
  ami             = data.aws_ami.amazon_linux_latest.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [var.security_group_id]
  subnet_id       = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}