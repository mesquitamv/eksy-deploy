# Common
aws_region = "us-east-1"

# AWS VPC
vpc_cidr = "10.0.0.0/16"
vpc_extra_cidr = []
private_subnet = {
  private-subnet-1 = {
    subnet_cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
  },
  private-subnet-2 = {
    subnet_cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
  },
}
public_subnet = {
  public-subnet-1 = {
    subnet_cidr_block = "10.0.128.0/24"
    availability_zone = "us-east-1a"
  },
}

# AWS EKS 
eks_cluster_name        = "eksy"
eks_version             = "1.23"
role_arn                = "arn:aws:iam::335233727287:role/eks-cluster-role"
nodegroup = {
  nodegroup-1 = {
    nodegroup_name          = "nodegroup-1"
    nodegroup_instance_type = ["t2.small"]
    nodegroup_desired_size  = "2"
    nodegroup_max_size      = "10"
    nodegroup_min_size      = "2"
  }
}