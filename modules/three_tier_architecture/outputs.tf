output "vpc_id" {
  value = module.network.vpc.id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "bastion_eips" {
  value = tomap({
    for k, instance_eip in aws_eip.module : k => instance_eip.public_ip
  })
}

output "app_server_private_ips" {
  value = tomap({
    for k, instance in module.ec2_app : k => instance.private_ip
  })
}