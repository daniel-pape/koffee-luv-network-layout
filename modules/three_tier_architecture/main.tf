locals {
  availability_zones = ["a", "b", "c"]
}

module "network" {
  source             = "./networking"
  availability_zones = local.availability_zones
  vpc_name           = var.vpc_name
  vpc_region         = var.region
  vpc_cidr_block     = "172.16.0.0/16"
  public_subnet_cidr_blocks = {
    a = "172.16.1.0/24"
    b = "172.16.2.0/24"
    c = "172.16.3.0/24"
  }
  app_subnet_cidr_blocks = {
    a = "172.16.4.0/24"
    b = "172.16.5.0/24"
    c = "172.16.6.0/24"
  }
  db_subnet_cidr_blocks = {
    a = "172.16.8.0/24"
    b = "172.16.9.0/24"
    c = "172.16.10.0/24"
  }
  ig_name        = "MyIGW"
  public_rt_name = "MyPublicRoute"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = file(var.ssh_deployer_public_key_file)
}

module "ec2s_bastion" {
  for_each          = toset(local.availability_zones)
  source            = "./ec2"
  key_name          = aws_key_pair.deployer.key_name
  instance_name     = "BastionHost"
  security_group_id = module.network.sg["bastion"].id
  subnet_id         = module.network.subnet_ids[each.key]["public_subnet_id"]
}

resource "aws_eip" "module" {
  for_each = module.ec2s_bastion
  vpc      = true
  instance = each.value.instance.id

  tags = {
    Name = "BastionEIP"
  }
}

module "ec2_app" {
  for_each          = toset(local.availability_zones)
  source            = "./ec2"
  key_name          = aws_key_pair.deployer.key_name
  instance_name     = "AppServer"
  security_group_id = module.network.sg["app"][each.key].id
  subnet_id         = module.network.subnet_ids[each.key]["app_subnet_id"]
}

