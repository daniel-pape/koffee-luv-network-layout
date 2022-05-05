variable "vpc_name" {
  type = string
  description = "The name of the VPC"
}

variable "vpc_cidr_block" {
  type = string
  description = "The CIDR block assigned to the VPC"
}

variable "vpc_region" {
  type = string
  description = "The region of the VPC"
}

variable "availability_zones" {
  type = list(string)
  description = "The availability zones used for replication"
}

variable "public_subnet_cidr_blocks" {
  type = map(string)
  description = "Map each availability zone to its CIDR block used for the public subnet"
}

variable "app_subnet_cidr_blocks" {
  type = map(string)
  description = "Map each availability zone to its CIDR block used for the app subnet"
}

variable "db_subnet_cidr_blocks" {
  type = map(string)
  description = "Map each availability zone to its CIDR block used for the app subnet"
}

variable "ig_name" {
  type= string
  description = "The name for the internet gateway associated with the VPC"
}

variable "public_rt_name" {
  type = string
  description = "The name of the public route table"
}
