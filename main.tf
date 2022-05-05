module "three_tier_architecture" {
  source   = "./modules/three_tier_architecture"
  region   = var.region
  vpc_name = "VPC"
  ssh_deployer_public_key_file = var.ssh_deployer_key_file
}

