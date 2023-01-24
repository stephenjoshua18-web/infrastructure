terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }


  backend "s3" {
    bucket = "glade-terraform"
    key    = "tf-statefile"
    region = "eu-west-1"
  }

}

provider "aws" {
  region     = "${var.region}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDu0L2P/o7TdU2mziKIOadPPsC+q7HUSWREXuOTQzfSfsIc7uOBx6b/5lmnJbUukcPAFpyv5YKCw3swen8dTczFKw+7V5WLE7Gtw7NIuxkaQNMBo3DVWkZVvrpFl9rImm9Az5O7RBAwFWQzsapcW7h3+ttxyAE776fXu5dS+33XWUl9thQ2p7viyX5RTWYDeXOzBcpSBbecQRUGcCDmI0HB2fD0+zZaaybdS1PNSMF88Ga4wIdU/1t6MsrXSh4zEjWFe03Lf6OElnY6+IXXPvnVbbAxxuGVMEw6SCtfPpYh9PuRVwAsqI2C524GZLfqL6/T3vLqF9iglr/wh6jEf4geZh7pjIh380m5xVTva8PoPvAgUS5L+NRJLhXGzE2ZVh+mePW5/UYJT1Hs60XgZhJFp2AaBFVrGJjPyPto6KEKQ3oeMABYRdhf9oGkzCKqAEf6ImRAUGMTD6VzjxfoWaolPHf0A1HYa6jqzlv6IfEvH/RG8zjeH/UMgJBHgCqx9ysE/5Xdd1jQdzK9xs9CBJ2Wn9ZfIJ3ZlanT6RWVkywNaI78jr6cJlanxf34Oa3M6F87nNMbxO82JDNZ34gVEK6z2eqQqRsJL4FAaP7efBwaYlquOUJzwRXOayAzrO55Rrhv/eUfQuxY8a/N1qpK94BK4gMlcZuB1T2MXKZx3w8eEw=="
}


resource "aws_default_vpc" "gladepay-net" {
  
}

resource "aws_default_subnet" "default_subnet" {
  availability_zone = "eu-west-1b"

}

data "aws_ec2_instance_type" "glade_instance_sm" {
  instance_type = "t2.small" # 1vcpu, 2gb mem
}

data "aws_ec2_instance_type" "glade_instance_md" {
  instance_type = "t2.medium" # 2vcpu, 4gb mem
}

data "aws_ec2_instance_type" "glade_instance_lg" {
  instance_type = "t2.large" # 2vcpu, 8gb mem
}

data "aws_ec2_instance_type" "glade_instance_xl" {
  instance_type = "t2.xlarge" # 4vcpu, 16gb mem
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20221206"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_route53_zone" "gladeng_zone" {
  name = "glade.ng"
}
