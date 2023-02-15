
######
#
# Default Security Group for Production Services
#
######

resource "aws_security_group" "sg_glade_production" {
  name        = "sg_glade_production"
  description = "Default Rules for all Glade Services"
  vpc_id      = "vpc-0bcbfe2d07829a61f"

  tags = {
    Name = "sg_glade_production"
  }
}

resource "aws_security_group_rule" "internal_ingress_rule" {
  description       = "All Internal Traffice within VPC"
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  security_group_id = aws_security_group.sg_glade_production.id
}

resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["86.92.65.85/32"]
  security_group_id = aws_security_group.sg_glade_production.id
}

resource "aws_security_group_rule" "allow_all_tls" {
  description       = "All External TLS"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_glade_production.id
}

resource "aws_security_group_rule" "allow_all_http" {
  description       = "All External http"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_glade_production.id
}

resource "aws_security_group_rule" "allow_all_ssh" {
  description       = "All External SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["86.92.65.85/32", "134.209.28.21/32", ]
  security_group_id = aws_security_group.sg_glade_production.id
}
