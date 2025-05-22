resource "aws_lb" "elb" {
  name = "elb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.sg_elb ]
  subnets = [ var.main_subnet_id, var.standby_subnet_id ]
}

resource "aws_lb_target_group" "jenkins_tg" {
  name = "jenkinstg"
  port = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance" 
  health_check {
    path                = "/login"
    protocol            = "HTTP"
    port                = 8080
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group" "main_tg" {
  name = "maintg"
  port = 32653
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"   
}

resource "aws_lb_target_group" "standby_tg" {
  name = "sectg"
  port = 32653
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"   
}

resource "aws_lb_listener" "main-lsnr" {
  load_balancer_arn = aws_lb.elb.arn
  port = 80
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.main_tg.arn
      }
    }
  }
}

resource "aws_lb_listener" "main-express-lsnr" {
  load_balancer_arn = aws_lb.elb.arn
  port = 3001
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.main_tg.arn
      }
    }
  }
}

resource "aws_lb_listener" "standby-lsnr" {
  load_balancer_arn = aws_lb.elb.arn
  port = 8000
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.standby_tg.arn
      }
    }
  }
}

resource "aws_lb_listener" "jenkins_listener" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.jenkins_tg.arn
  }
}


resource "aws_lb_target_group_attachment" "worker_attch"{
  target_group_arn = aws_lb_target_group.main_tg.arn
  target_id = var.worker_id
}


resource "aws_lb_target_group_attachment" "standby_worker_attch" {
  target_group_arn = aws_lb_target_group.standby_tg.arn
  target_id = var.standby_worker_id
}

resource "aws_lb_target_group_attachment" "jenkins_attch" {
  target_group_arn = aws_lb_target_group.jenkins_tg.arn
  target_id = var.jenkins_id
}