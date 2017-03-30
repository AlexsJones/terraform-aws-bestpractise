variable "ami" {
  default = "ami-076d5d61"
}

variable "region" {
  default = "eu-west-1"
}

variable "availability_zone" {
  type = "map"

  default = {
    primary   = "eu-west-1a"
    secondary = "eu-west-1b"
  }
}

variable "amazon_amis" {
  type = "map"

  default = {
    eu-west-1 = "ami-70edb016"
  }
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_cidr_block1" {
  default = "10.0.128.0/20"
}

variable "public_cidr_block2" {
  default = "10.0.144.0/20"
}

variable "private_cidr_block1" {
  default = "10.0.0.0/19"
}

variable "private_cidr_block2" {
  default = "10.0.32.0/19"
}
