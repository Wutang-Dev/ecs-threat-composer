output "app_environment_arn" {
  description = "The ARN of the app environment SSM parameter"
  value = aws_ssm_parameter.app_environment.arn
}

