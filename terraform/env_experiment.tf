resource "aws_instance" "experiment" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_sm.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "experiment"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}


resource "aws_route53_record" "experiment_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "experiment-internal-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.private_ip]
}

resource "aws_route53_record" "experiment_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "experiment-external-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "core_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "db_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "webhook_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "dashboard_api_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "dashboard_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "office_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "office_api_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "checkout_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "mobile_api_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "qc_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "external_api_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

resource "aws_route53_record" "pay_experiment_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-experiment.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.experiment.public_ip]
}

