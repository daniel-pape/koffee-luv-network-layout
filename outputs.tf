output "vpc_id" {
  value = module.three_tier_architecture.vpc_id
}

output "subnet_ids" {
  value = module.three_tier_architecture.subnet_ids
}

output "bastion_eips" {
  value = module.three_tier_architecture.bastion_eips
}

output "app_server_private_ips" {
  value = module.three_tier_architecture.app_server_private_ips
}

output "bastion_a_eips" {
  value = module.three_tier_architecture.bastion_eips["a"]
}

output "app_a_private_ip" {
  value = module.three_tier_architecture.app_server_private_ips["a"]
}

output "bastion_b_eips" {
  value = module.three_tier_architecture.bastion_eips["b"]
}

output "app_b_private_ip" {
  value = module.three_tier_architecture.app_server_private_ips["b"]
}

output "bastion_c_eips" {
  value = module.three_tier_architecture.bastion_eips["c"]
}

output "app_c_private_ip" {
  value = module.three_tier_architecture.app_server_private_ips["c"]
}
