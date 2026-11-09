module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  acm_certificate_arn = module.acm.acm_certificate_arn
}
module "alb" {
  source = "./modules/alb"

  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.vpc.alb_security_group_id
  vpc_id                = module.vpc.vpc_id
  acm_certificate_arn   = module.acm.acm_certificate_arn
}
module "ecs" {
  source                = "./modules/ecs"
  threat_composer_tag   = var.elb_threat_composer_tag
  container_image       = var.container_image
  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_security_group_id = module.vpc.ecs_security_group_id
  alb_target_group_arn  = module.alb.alb_target_group_arn

  depends_on = [module.alb]
}
data "aws_route53_zone" "main" {
  name         = "rginfralabs.co.uk."
  private_zone = false
}
module "acm" {
  source = "./modules/acm"

  domain_name     = var.domain_name
  route53_zone_id = data.aws_route53_zone.main.zone_id
}
# module route53
module "route53" {
  source = "./modules/route53"

  route53_zone_id = data.aws_route53_zone.main.zone_id
  domain_name     = var.domain_name
  alb_dns_name    = module.alb.alb_dns_name
  alb_zone_id     = module.alb.alb_zone_id
}
