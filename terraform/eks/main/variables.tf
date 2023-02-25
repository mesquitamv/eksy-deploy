# Common variables
variable "aws_region" {
  description = "AWS Region"
}

# VPC variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
}

variable "vpc_extra_cidr" {
  description = "List of extra CIDRss"
}

variable "private_subnet" {
  type = map(object({
    subnet_cidr_block = string
    availability_zone = string
  }))
  description = "Subnets info"
}
variable "public_subnet" {
  type = map(object({
    subnet_cidr_block = string
    availability_zone = string
  }))
  description = "Subnets info"
}

# EKS variables
variable "eks_cluster_name" {
  description = "Name of EKS cluster"
}

variable "eks_version" {
  description = "Version of EKS"
}

variable "role_arn" {
  description = "Role that will be used to create EKS"
}

variable "nodegroup" {
  type = map(object({
    nodegroup_name = string
    nodegroup_instance_type = list(string)
    nodegroup_desired_size = string
    nodegroup_max_size = string
    nodegroup_min_size = string
  }))
  description = "Nodegroup info"
}
