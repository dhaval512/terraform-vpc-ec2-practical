# create a load balancer 
resource "aws_lb" "web-server" {
  depends_on         = [module.vpc.internetgateway,aws_security_group.load_balancer_sg]
  name               = "web-server-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.load_balancer_sg.id}"]
  subnets            = element(module.vpc.publicsubnet.*, 1)
  enable_http2       = false


  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "web-server" {
  name     = "web-server-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc
  health_check {
    healthy_threshold   = 2
    interval            = 10
    timeout             = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "web-server-listener" {
  load_balancer_arn = aws_lb.web-server.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-server.arn
  }
}