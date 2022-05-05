resource "aws_subnet" "module_public" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_block
  availability_zone = var.az

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "module_app" {
  vpc_id            = var.vpc_id
  cidr_block        = var.app_cidr_block
  availability_zone = var.az

  tags = {
    Name = var.app_subnet_name
  }
}

resource "aws_subnet" "module_db" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_cidr_block
  availability_zone = var.az

  tags = {
    Name = var.db_subnet_name
  }
}