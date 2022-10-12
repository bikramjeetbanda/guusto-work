variable "region" {
  description = "AWS region"
}

variable "aws_account" {
  type        = string
  description = "AWS Account"
}
variable "username" {
  type    = list(string)
}
variable "userarn" {
  type    = list(string)
}
variable "groups" {
  type    = list(string)
}

variable "vpc_private_subnets" {
  type    = list(string)
}

variable "vpc_cidr" {
  type    = string
}

variable "min_size" {
  type    = number
}

variable "max_size" {
  type    = number
}

variable "desired_size" {
  type    = number
}

variable "instance_types" {
  type    = list(string)
}

variable "capacity_type" {
  type    = string
}
