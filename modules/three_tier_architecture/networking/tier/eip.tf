resource "aws_eip" "elastic_ip_for_nat_gw" {
  vpc = true

  tags = {
    Name = "NatGwEIP for ${var.az}"
  }
}

