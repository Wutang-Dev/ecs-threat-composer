output "github_ecr_role_arn" {
  description = "IAM role ARN for GitHub Actions ECR publishing"
  value       = aws_iam_role.github_ecr.arn
}
