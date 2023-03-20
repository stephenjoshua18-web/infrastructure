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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKAN6ZhSsBACbsEQDShd5WHfBWj1NTyPoXBeYrAe4oiRdSEYYx4u6SFA08e5N4Rdgkl4wtTQOH/+uLgMFU4UB4JPjcp9XFjuTrocZDLaTBJPcQQSZXX6LabMuILnx6qQb7ujK389BzyuZBYNvyBnq6FDRzoLN9AEugfRMLH2a0fv3c0N/AuhvUPHWGBZFgT/2+ucCZ1OBllZtYgVHg1kvtJ+FQ/RsasBDVfnolOxjju+LwjQ3ikda5pLCaaTWVj5z44FLzI9mstHlubSA0LmylJZlZ27K69qOJ1eFgN8rGusNzySgb06XfM9lOdAE7OahkOHu0cexVblMqsz0xQ1kGNU7WemnvYApAse6n/4htJM++HmbTQYqp/kKiUfDxs4C4qunEyqFxGg4gDWS+Qeuo7Cr/mfmL5N4SQIhXOzMTWitEAsyDPxvYazHtM0i1aRWVtKOKXjl7lTjvdC+In4UE8woocW1/9bUuFRSj05NMnPyWc0BMXDmRcI7pTrgvIdk="
}

resource "aws_eip" "db_service_eip" {
  instance = aws_instance.db_service.id
}

resource "aws_eip" "core_service_eip" {
  instance = aws_instance.core_service.id
}

resource "aws_default_vpc" "gladepay-net" {
  
}

resource "aws_default_subnet" "default_subnet" {
  availability_zone = "eu-west-1b"

}

data "aws_ec2_instance_type" "glade_instance_sm" {
  instance_type = "t3a.small" # 1vcpu, 2gb mem
}

data "aws_ec2_instance_type" "glade_instance_md" {
  instance_type = "t3a.medium" # 2vcpu, 4gb mem
}

data "aws_ec2_instance_type" "glade_instance_lg" {
  instance_type = "t3a.large" # 2vcpu, 8gb mem
}

data "aws_ec2_instance_type" "glade_instance_xl" {
  instance_type = "t3a.xlarge" # 4vcpu, 16gb mem
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

resource "aws_route53_zone" "gladefinance_zone" {
  name = "gladefinance.co"
}
