resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "module_ig" {
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = var.ig_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.module_ig.id
  destination_cidr_block = "0.0.0.0/0"
}

module "tiers" {
  for_each           = toset(var.availability_zones)
  source             = "./tier"
  az                 = "${var.vpc_region}${each.key}"
  vpc_id             = aws_vpc.module_vpc.id
  public_cidr_block  = var.public_subnet_cidr_blocks[each.key]
  public_subnet_name = "public${upper(each.key)}"
  app_cidr_block     = var.app_subnet_cidr_blocks[each.key]
  app_subnet_name    = "App${upper(each.key)}"
  db_cidr_block      = var.db_subnet_cidr_blocks[each.key]
  db_subnet_name     = "Db${upper(each.key)}"
  internet_gateway   = aws_internet_gateway.module_ig
  public_rt          = aws_route_table.public
  private_rt_name    = "MyPrivateRoute${upper(each.key)}"
}

