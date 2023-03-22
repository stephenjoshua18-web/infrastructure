resource "aws_route53_record" "pay_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-external-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.pay_service.public_ip]
}
