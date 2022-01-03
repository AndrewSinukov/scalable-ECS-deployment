resource "aws_alb" "api" {
  name               = "${local.prefix}-api"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
  security_groups = [
    aws_security_group.lb.id
  ]

  tags = local.common_tags
}

resource "aws_alb_target_group" "api" {
  name        = "${local.prefix}-api"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"
  port        = 8000

  health_check {
    path = "/health"
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = aws_alb.api.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.api.arn
  }
}

resource "aws_security_group" "lb" {
  description = "Allow access to application load balancer"
  name        = "${local.prefix}-lb"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
