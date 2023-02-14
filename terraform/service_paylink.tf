resource "aws_instance" "pay_service" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = data.aws_ec2_instance_type.glade_instance_sm.instance_type 
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = aws_default_subnet.default_subnet.id
  vpc_security_group_ids = [ aws_security_group.sg_glade_production.id ]
  tags = {
    Name = "pay_service"
  }

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}


resource "aws_route53_record" "pay_internal_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-internal-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.pay_service.private_ip]
}

resource "aws_route53_record" "pay_external_dns" {
  zone_id = aws_route53_zone.gladeng_zone.zone_id
  name    = "pay-external-prod-aws.glade.ng"
  type    = "A"
  ttl     = 300
  records = [aws_instance.pay_service.public_ip]
}
