variable "threat_composer_tag" {
  description = "The tag for the threat composer."
  type        = string
  default     = "threat-composer-ecs"
}
variable "ecs_task_execution_role_policy_arn" {
  description = "The ARN of the ECS task execution role policy."
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
variable "container_image" {
  description = "The container image to use for the ECS task."
  type        = string
  default     = "nginx:latest"
}
variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}
