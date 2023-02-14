resource "aws_instance" "staging" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_sm.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "staging"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}


resource "aws_route53_record" "staging_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "staging-internal-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.private_ip]
}

resource "aws_route53_record" "staging_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "staging-external-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "core_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "db_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "webhook_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "dashboard_api_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "dashboard_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "office_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "office_api_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "checkout_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "mobile_api_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "qc_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "external_api_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "pay_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}
