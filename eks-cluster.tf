module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.14.0"

  cluster_name    = local.cluster_name
  cluster_version = var.k8s_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  tags = {
    environment = "development"
    application = "myapp"
    Terraform = "true"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t3.micro"]
      labels = {
        Environment = var.env_prefix
      }
    }
  }

  fargate_profiles = {
    default = {
      name = "my-fargate-profile"
      selectors = [
        {
          namespace = "my-app"
        }
      ]
    }
  }
}