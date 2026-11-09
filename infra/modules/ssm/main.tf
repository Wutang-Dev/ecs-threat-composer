# resource aws ssm parameter name app environment
resource "aws_ssm_parameter" "app_environment" {
  name        = "/${var.project_name}/app/environment"
  description = "Application environment for ECS Threat Composer"
  type        = "String"
  value       = var.app_environment
  tags = {
    Project = var.project_name
  }
}
