variable "region" {
  default = "eu-west-1"
}

variable "volume_size" {
  default = "20"
}

variable "instance_profile_arn"{
  default = "arn:aws:iam::016246313804:instance-profile/secrets_manager_readonly"
}