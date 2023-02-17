
######
#
# Default Security Group for dmz Services
#
######

resource "aws_security_group" "sg_glade_dmz" {
  name        = "sg_glade_dmz"
  description = "Default Rules for all Glade Services"
  vpc_id      = "vpc-0bcbfe2d07829a61f"

  tags = {
    Name = "sg_glade_dmz"
  }
}

resource "aws_security_group_rule" "dmz_internal_ingress_rule" {
  description       = "All Internal Traffice within VPC"
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "86.92.65.85/32", "134.209.28.21/32", "52.50.24.104/32"]
  security_group_id = aws_security_group.sg_glade_dmz.id
}

resource "aws_security_group_rule" "dmz_allow_all_egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_glade_dmz.id
}

resource "aws_security_group_rule" "dmz_allow_all_egress_from_internal" {
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  source_security_group_id = aws_security_group.sg_glade_dmz.id
  security_group_id = aws_security_group.sg_glade_dmz.id
}


