resource "aws_instance" "sandbox" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "sandbox"
  }

}


resource "aws_route53_record" "sandbox_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "sandbox-internal-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.private_ip]
}

resource "aws_route53_record" "sandbox_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "sandbox-external-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "core_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "db_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "webhook_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "dashboard_api_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "dashboard_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "office_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "office_api_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "checkout_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "mobile_api_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "qc_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "external_api_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}
