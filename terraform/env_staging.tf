resource "aws_instance" "staging" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_dmz.id ]
  iam_instance_profile = "${var.instance_profile_arn}"
  tags = {
    Name = "staging"
  }

  root_block_device {
    volume_size           = 50
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

resource "aws_route53_record" "dashboard_api_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-v2-staging.glade.ng"
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

resource "aws_route53_record" "external_api1_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "api-staging.glade.ng"
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

resource "aws_route53_record" "website_staging_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "website-staging.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}


resource "aws_route53_record" "staging_2_internal_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "staging-internal-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.private_ip]
}

resource "aws_route53_record" "staging_2_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "staging-external-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "core_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "core-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "db_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "db-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "webhook_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "webhook-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "dashboard_api_4_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-v2-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "dashboard_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "office_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "office-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "office_api_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "office-api-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "checkout_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "checkout-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "mobile_api_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "mobile-api-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "qc_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "qc-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "external_api_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "external-api-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "external_api2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "api-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "pay_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "pay-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}

resource "aws_route53_record" "website_2_staging_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "website-staging.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.staging.public_ip]
}
