variable "instance_type" {
  type = string
  description = "The type of the EC2 instance"
  default = "t3.micro"
}

variable "instance_name" {
  type = string
  description = "The name of the EC2 instance"
}

variable "security_group_id" {
  type = string
  description = "The id of the security group"
}

variable "subnet_id" {
  type = string
  description = "The id of the subnet the EC2 instance should belong to"
}

variable "key_name" {
  type = string
  description = "The name of the key pair for accessing the EC2 instance"
}