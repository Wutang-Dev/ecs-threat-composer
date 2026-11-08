module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  acm_certificate_arn = var.acm_certificate_arn
}
module "alb" {
  source = "./modules/alb"

  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.vpc.alb_security_group_id
  vpc_id                = module.vpc.vpc_id
  acm_certificate_arn   = var.acm_certificate_arn
}
module "ecs" {
  source              = "./modules/ecs"
  threat_composer_tag = var.elb_threat_composer_tag
  container_image     = var.container_image
}