module "container_eks-aws-auth" {
  source  = "tedilabs/container/aws//modules/eks-aws-auth"
  version = "0.13.0"

  map_users = [{
    iam_user = var.userarn[0]
    username = var.username[0]
    groups   = var.groups
  }]
}

