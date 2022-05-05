output "vpc" {
  value = aws_vpc.module_vpc
}

output "sg" {
  value = {
    bastion = aws_security_group.bastion_sg_group
    app     = aws_security_group.app_sg_group
  }
}

output "subnet_ids" {
  value = tomap({
    for k, subnet_ids in module.tiers : k => subnet_ids.subnet_ids
  })
}


