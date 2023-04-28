resource "aws_route53_record" "blog_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "blog.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.website_ip]
}
resource "aws_route53_record" "blog_backend_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "blog-backend.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.website_ip]
}

resource "aws_route53_record" "www_external_dns" {
  zone_id = aws_route53_zone.gladefinance_zone.zone_id
  name    = "www.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [var.website_ip]
}

resource "aws_route53_record" "www_external_gladeng_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "www.glade.ng"
  type    = "A"
  ttl     = 300
  records = [var.website_ip]
}
