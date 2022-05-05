variable "region" {
  type        = string
  description = "The AWS region in which the network is created"
}

variable "ssh_deployer_key_file" {
  type = string
  description = "The absolute path to the .pub file containing the public key"
}