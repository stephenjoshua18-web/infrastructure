resource "aws_instance" "testing" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  security_groups = [ aws_security_group.default-glade-services-sg.id ]
  tags = {
    Name = "testing"
  }

}


resource "aws_route53_record" "testing_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "testing-internal-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.private_ip]
}

resource "aws_route53_record" "testing_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "testing-external-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "core_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "db_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "webhook_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "dashboard_api_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "dashboard_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "office_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "office_api_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "checkout_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "mobile_api_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "qc_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "external_api_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}