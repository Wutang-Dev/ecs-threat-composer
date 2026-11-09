resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.threat_composer_tag}-ecs-cluster"

  tags = {
    Name = "${var.threat_composer_tag}-ecs-cluster"
  }
}
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.threat_composer_tag}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "${var.threat_composer_tag}-ecs-task-execution-role"
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = var.ecs_task_execution_role_policy_arn
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.threat_composer_tag}-ecs-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "${var.threat_composer_tag}-container"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        },
      ]
      secrets = [
        {
          name      = "APP_ENV"
          valueFrom = var.app_environment_parameter_arn
        }
      ]
    },
  ])
}
resource "aws_ecs_service" "ecs_service" {
  name            = "${var.threat_composer_tag}-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "${var.threat_composer_tag}-container"
    container_port   = 8080
  }

  depends_on = [
  aws_iam_role_policy_attachment.ecs_task_execution_role_policy,
  aws_iam_role_policy.ecs_ssm_access
]
}
resource "aws_iam_role_policy" "ecs_ssm_access" {
  name = "${var.threat_composer_tag}-ecs-ssm-access"
  role = aws_iam_role.ecs_task_execution_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameters"
        ]
        Resource = var.app_environment_parameter_arn
      }
    ]
  })
}
