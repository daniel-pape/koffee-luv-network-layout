# Public subnet uses public_rt route table
# for it's network traffic, giving it access to
# the internet via the IG:
resource "aws_route_table_association" "module_public" {
  route_table_id = var.public_rt.id
  subnet_id      = aws_subnet.module_public.id
}

# MyPrivateRoute<A|B|C> route table, connected to
# the NAT GW and the App and DB private subnets via the below
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.private_rt_name
  }
}

# Send any traffic from subnets using private_route_table,
# destined for any IPv4 address to the NAT Gateway:
resource "aws_route" "nat_gw_route" {
  route_table_id         = aws_route_table.private_route_table.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

# Both subnets, module_app and module_db, use
# the private_route_table for their network traffic:
resource "aws_route_table_association" "module_app" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.module_app.id
}

resource "aws_route_table_association" "module_db" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.module_db.id
}

