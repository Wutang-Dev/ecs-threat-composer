resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    =[var.alb_security_group_id]
  subnets            = var.public_subnet_ids
  tags = {
    Name = var.alb_name
  }
}
