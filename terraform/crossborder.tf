resource "aws_route53_record" "core_internal_gladefinance_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "core-archive-v2-internal.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.crossborder_ip]
}
resource "aws_route53_record" "dashboard_internal_gladefinance_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "dashboard-api-internal.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.crossborder_ip]
}
resource "aws_route53_record" "mobileapi_internal_gladefinance_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "mobile-api-archive-v2-internal.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.crossborder_ip]
}
