resource "aws_route53_record" "providus_internal_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = " providus-internal.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.providus_ip]
}

