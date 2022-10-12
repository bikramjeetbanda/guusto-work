module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"
  cluster_name    = local.cluster_name

  cluster_version = "1.22"
  subnet_ids      = var.vpc_private_subnets

  cluster_endpoint_private_access  = true

  vpc_id = var.vpc_cidr
  
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  manage_aws_auth_configmap = true
  enable_irsa = false
  aws_auth_users = [
    {
      userarn  = var.userarn[0]
      username = var.username[0]
      groups   = ["system:masters"] }
    
  ]

  eks_managed_node_groups = {
    managed_node = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type
    }
  }

  tags = {
    Environment = "eks"
    Terraform   = "true"    
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
