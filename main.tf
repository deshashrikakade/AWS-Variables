resource "aws_elb" "elbname" {
  name               = "ELB"
  availability_zones = ["us-west-1a", "us-west-1b", "us-west-1c"]


  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.elbtimeout
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "Info-tech"
  }
}

resource aws_instance "jen" {
    ami ="ami-0bb84b8ffd87024d8"
    instance_type = "var.instancetype[0]" 
    tags {
        name = var.instancename[0]

    }
}

resource aws_instance "ansible" {
    ami ="ami-0bb84b8ffd87024d8"
    instance_type = "var.instancetype[1]"
    tags {
        name = var.instancename[1]
    }
}
