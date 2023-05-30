# terraform {
#     required_version = ">= 0.12"
#     backend "s3" {
#         bucket = "myapp-bucket"
#         key = "myapp/state.tfstate"
#         region = "eu-west-3"
#     }
# }

provider "aws" {
  region = var.region
}

# Get the entire array
data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.cluster_name # "my-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  # Insert required variables here
  name = "vpc"
  cidr = var.vpc_cidr_block
  azs = data.aws_availability_zones.available.names
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets = var.public_subnet_cidr_blocks
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}