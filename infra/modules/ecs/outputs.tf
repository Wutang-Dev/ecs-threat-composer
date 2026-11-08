output "ecs_cluster_id" {
  value       = aws_ecs_cluster.ecs_cluster.id
  description = "The ID of the ECS cluster."
}
output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.ecs_cluster.arn
  description = "The ARN of the ECS cluster."
}