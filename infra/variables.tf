variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-north-1"
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
variable "alb_internal" {
  description = "Whether the Application Load Balancer is internal or internet-facing."
  type        = bool
  default     = false
}
variable "alb_threat_composer_tag" {
  description = "The tag for the Application Load Balancer."
  type        = string
  default     = "threat-composer-alb"
}
variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for the ALB."
  type        = string
}
variable "elb_threat_composer_tag" {
  description = "The tag for the ELB."
  type        = string
  default     = "threat-composer-elb"
}
variable "container_image" {
  description = "The container image to use for the ECS task."
  type        = string
}
#domain name and route53 zone id for acm certificate
variable "domain_name" {
  description = "The domain name for the ACM certificate."
  type        = string
}
