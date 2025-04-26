#-----main.tf-----
#===================
terraform {
  required_providers {
    aws = {
      version = "~> 3.44.0"
    }
  }

  required_version = ">= 0.15.5"
}

provider "aws" {
  region = var.region
}

#Deploy Networking Resources
#============================
module "vpc" {
  source = "./modules/vpc"
}

#Deploy Compute Resources
#============================
module "compute" {
  source         = "./modules/compute"
  subnets        = module.vpc.public_subnets
  security_group = module.vpc.public_sg
  subnet_ips     = module.vpc.subnet_ips
  ssh_key_public = var.ssh_key_public
  ssh_key_private = var.ssh_key_private
}
