resource "aws_instance" "qc_service" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  security_groups = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "qc_service"
  }

}


resource "aws_route53_record" "qc_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.qc_service.private_ip]
}

resource "aws_route53_record" "qc_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-external-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.qc_service.public_ip]
}