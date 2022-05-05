output "instance" {
  value = aws_instance.module
}

output "private_ip" {
  value = aws_instance.module.private_ip
}