#variable for region 
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
#variable for alb_threat_composer_tag
variable "alb_threat_composer_tag" {
  description = "The tag for the Application Load Balancer."
  type        = string
  default     = "threat-composer-alb"
}