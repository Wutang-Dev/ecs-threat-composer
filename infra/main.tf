module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}
module "alb" {
  source = "./modules/alb"

  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.vpc.alb_security_group_id
}