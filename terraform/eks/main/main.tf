provider "aws" {
  region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "lc-terraform-tfstates"
    key    = "eks-live-code/eks-live-code-state.tfstate"
    region = "us-east-1"
  }
}

module "aws_vpc" {
  source = "../modules/aws_vpc"
  
  vpc_cidr       = var.vpc_cidr
  vpc_extra_cidr = var.vpc_extra_cidr
  aws_region     = var.aws_region
  private_subnet = var.private_subnet
  public_subnet  = var.public_subnet
}

locals {
  eks_network_ids = [module.aws_vpc.private_subnet_spec.private-subnet-1.id,module.aws_vpc.private_subnet_spec.private-subnet-2.id]
}

module "aws_eks" {
  source = "../modules/aws_eks"

  eks_cluster_name = var.eks_cluster_name
  eks_version      = var.eks_version
  role_arn         = var.role_arn
  eks_network_ids  = local.eks_network_ids
  nodegroup        = var.nodegroup
}
