resource "aws_security_group" "app_sg_group" {
  for_each = toset(var.availability_zones)

  name        = "AppSG${upper(each.key)}"
  description = "The security group used in the application layer"
  vpc_id      = aws_vpc.module_vpc.id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = [var.public_subnet_cidr_blocks[each.key]]
    description = "Allow SSH from Public${upper(each.key)} subnet"
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "AppSG"
  }
}

resource "aws_security_group" "bastion_sg_group" {
  name        = "BastionSG"
  description = "The security group used by the bastion server"
  vpc_id      = aws_vpc.module_vpc.id

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic"
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "BastionSG"
  }
}