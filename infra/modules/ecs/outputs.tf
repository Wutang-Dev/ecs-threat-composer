output "ecs_cluster_id" {
  value       = aws_ecs_cluster.ecs_cluster.id
  description = "The ID of the ECS cluster."
}
output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.ecs_cluster.arn
  description = "The ARN of the ECS cluster."
}
output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.ecs_task_definition.arn
  description = "The ARN of the ECS task definition."
}