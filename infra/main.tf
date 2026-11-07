# vpc module 
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}