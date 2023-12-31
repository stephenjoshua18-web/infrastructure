resource "aws_instance" "dashboard_service" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  iam_instance_profile = "${var.instance_profile_arn}"
  tags = {
    Name = "dashboard_service"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}


resource "aws_route53_record" "dashboard_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.private_ip]
}

resource "aws_route53_record" "dashboard_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-external-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_api_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-external-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_public_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_v2_public_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-v2.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_api_public_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}


resource "aws_route53_record" "dashboard_api_1_public_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-api-v2.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_prod_public_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "dashboard-prod.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}



resource "aws_route53_record" "dashboard_2_internal_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-internal-prod-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.private_ip]
}

resource "aws_route53_record" "dashboard_2_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-external-prod-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-external-prod-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_2_public_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_2_v2_public_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-v2.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_api_2_public_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}


resource "aws_route53_record" "dashboard_api_5_public_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-v2.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

resource "aws_route53_record" "dashboard_2_prod_public_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-prod.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.dashboard_service.public_ip]
}

