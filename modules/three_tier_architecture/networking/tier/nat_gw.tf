resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip_for_nat_gw.id
  subnet_id     = aws_subnet.module_public.id

  depends_on = [var.internet_gateway]

  tags = {
    Name = "NatGW for AZ ${var.az}"
  }
}