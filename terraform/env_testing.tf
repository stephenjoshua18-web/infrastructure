resource "aws_instance" "testing" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_dmz.id ]
  iam_instance_profile = "${var.instance_profile_arn}"

  # root disk
  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  
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

resource "aws_route53_record" "dashboard_api_v2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-v2-testing.glade.ng"
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

resource "aws_route53_record" "pay_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "website_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "website-testing.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "testing_2_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "testing-internal-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.private_ip]
}

resource "aws_route53_record" "testing_2_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "testing-external-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "core_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "core-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "db_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "db-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "webhook_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "webhook-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_v2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-v2-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "dashboard_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "office_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "office_api_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "office-api-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "checkout_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "checkout-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "mobile_api_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "mobile-api-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "qc_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "external_api_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "external-api-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "pay_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

resource "aws_route53_record" "website_2_testing_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "website-testing.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.testing.public_ip]
}

