terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "lnaVPC" {
  source = "./modules/vpc"

  vpc_tags            = var.vpc_tags
  availability_zones  = local.availability_zones
  public_subnet_cidrs = local.public_subnet_cidrs
}
