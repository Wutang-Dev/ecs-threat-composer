variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type        = list(string)
}
variable "alb_security_group_id" {
  description = "The ID of the Application Load Balancer security group"
  type        = string
}

variable "load_balancer_type" {
  description = "The type of the load balancer"
  type        = string
  default     = "application"
}
variable "internal" {
  description = "Whether the load balancer is internal or internet-facing"
  type        = bool
    default     = false
}
variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "threat-composer-alb"
}
variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}