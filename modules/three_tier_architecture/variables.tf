variable "region" {
  type = string
  description = "The AWS region for the VPC"
}

variable "vpc_name" {
  type = string
  description = "The name of the VPC"
}

variable "ssh_deployer_public_key_file" {
  type = string
  description = "The absolute path to the .pub file containing the public key"
}