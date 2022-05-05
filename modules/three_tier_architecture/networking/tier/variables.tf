variable "az" {
  type        = string
  description = "The availability zone within the VPC that contains the tier"
}

variable "vpc_id" {
  type        = string
  description = "The id of the VPC that contains the tier"
}

variable "app_cidr_block" {
  type        = string
  description = "The CIDR block for the (private) app subnet"
}

variable "app_subnet_name" {
  type        = string
  description = "The name of the (private) app subnet"
}

variable "db_cidr_block" {
  type        = string
  description = "The CIDR block for the (private) db subnet"
}

variable "db_subnet_name" {
  type        = string
  description = "The name of the (private) db subnet"
}

variable "public_cidr_block" {
  type        = string
  description = "The CIDR block for the public subnet"
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the public subnet"
}

variable "internet_gateway" {
  type = any
  description = "The internet gateway of the VPC the tier is placed into"
}

variable "public_rt" {
  type = any
  description = "The aws_route_table used associated with the IG"
}

variable "private_rt_name" {
  type = string
  description = "The name of the public route table"
}