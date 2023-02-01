resource "aws_instance" "canary" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  security_groups = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "canary"
  }

}


resource "aws_route53_record" "canary_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "canary-internal-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.private_ip]
}

resource "aws_route53_record" "canary_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "canary-external-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "core_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "db_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "webhook_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "dashboard_api_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "dashboard_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "office_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "office_api_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "checkout_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "mobile_api_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "qc_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}

resource "aws_route53_record" "external_api_canary_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-canary.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.canary.public_ip]
}