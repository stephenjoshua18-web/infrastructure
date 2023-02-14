resource "aws_instance" "db_service_1" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "db_service_1"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}


resource "aws_route53_record" "db_internal_dns_1" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "1-db-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.db_service_1.private_ip]
}


resource "aws_instance" "db_service_2" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "db_service_2"
  }

}



resource "aws_route53_record" "db_internal_dns_2" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "2-db-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.db_service_2.private_ip]
}

resource "aws_instance" "db_service_3" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "db_service_3"
  }

}


resource "aws_route53_record" "db_internal_dns_3" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "3-db-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.db_service_3.private_ip
  ]
}

# Create a new load balancer
resource "aws_elb" "db-service-elb" {
  name               = "db-service-elb"
  #availability_zones = ["eu-west-1b"]
  subnets            = [aws_default_subnet.default_subnet.id]

  #access_logs {
  #  bucket        = "glade-elb-logs"
  #  bucket_prefix = "db_elb"
  #  interval      = 60
  #}

  listener {
    instance_port      = 443
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:eu-west-1:016246313804:certificate/6646502e-07f8-4f86-ba04-090cb72131af"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTPS:443/"
    interval            = 30
  }

  instances                   = [aws_instance.db_service_1.id, aws_instance.db_service_2.id, aws_instance.db_service_3.id]
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "db-service-elb"
  }
}

resource "aws_route53_record" "db-service-external-dns-lb" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-external-prod-aws.glade.ng"
  type    = "A"

  alias {
    name                   = aws_elb.db-service-elb.dns_name
    zone_id                = aws_elb.db-service-elb.zone_id
    evaluate_target_health = true
  }
}
