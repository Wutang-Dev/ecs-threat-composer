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
resource "aws_lb_target_group" "main" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}