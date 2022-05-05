resource "aws_route_table_association" "module_public" {
  route_table_id = var.public_rt.id
  subnet_id      = aws_subnet.module_public.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route" "nat_gw_route" {
  route_table_id         = aws_route_table.private_route_table.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "module_app" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.module_app.id
}

resource "aws_route_table_association" "module_db" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.module_db.id
}

