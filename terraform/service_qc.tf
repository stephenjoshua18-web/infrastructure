resource "aws_instance" "qc_service" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_md.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  iam_instance_profile = "${var.instance_profile_arn}"
  tags = {
    Name = "qc_service"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
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




resource "aws_route53_record" "qc_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-internal-prod-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.qc_service.private_ip]
}

resource "aws_route53_record" "qc_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "qc-external-prod-aws.gladefinance.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.qc_service.public_ip]
}
