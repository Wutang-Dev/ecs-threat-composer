variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
variable "threat_composer_tag" {
  description = "The tag for the threat composer."
  type        = string
  default     = "threat-composer-vpc"
}
variable "enable_dns_support" {
  description = "Enable DNS support for the VPC."
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC."
  type        = bool
  default     = true
}
variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}
variable "availability_zones" {
  description = "The availability zones for the subnets."
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

