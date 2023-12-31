resource "aws_instance" "sandbox" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_dmz.id ]
  iam_instance_profile = "${var.instance_profile_arn}"
  tags = {
    Name = "sandbox"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
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
  name    = "api-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "pay_sandbox_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-sandbox.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}


resource "aws_route53_record" "sandbox_2_internal_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "sandbox-internal-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.private_ip]
}

resource "aws_route53_record" "sandbox_2_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "sandbox-external-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "core_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "core-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "db_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "db-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "webhook_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "webhook-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "dashboard_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "office_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "office-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "office_api_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "office-api-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "checkout_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "checkout-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "mobile_api_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "mobile-api-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "qc_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "qc-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "external_api_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "api-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}

resource "aws_route53_record" "pay_2_sandbox_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "pay-sandbox.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.sandbox.public_ip]
}
