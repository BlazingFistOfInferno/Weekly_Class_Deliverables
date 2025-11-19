# should my resource name be utilizing _ or -, I currently use -. I'll need to look 
# into this for example -> fortressmaximus_alb vs fortressmaximus-alb
resource "aws_lb" "fortressmaximus-alb" {
  name               = "fortressmaximus-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.fortressmaximus-lb-sg-01.id]
  subnets            = [
    aws_subnet.public-subnet-us-east-1a.id,
    aws_subnet.public-subnet-us-east-1b.id,
    aws_subnet.public-subnet-us-east-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "fortressmaximus-alb"
    Service = "vpc"
    Owner   = "Optimus Prime"
    Planet  = "Cybertron"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.fortressmaximus-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fortressmaximus-tg.arn
  }
}

# data "aws_acm_certificate" "cert" {
#   domain   = "unicron-aisecops.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.fortressmaximus-alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.fortress-maximus-tg.arn
#   }
# }

output "lb_dns_name" {
  value       = aws_lb.fortressmaximus-alb.name
  description = "The DNS name of the vpc Load Balancer."
}
