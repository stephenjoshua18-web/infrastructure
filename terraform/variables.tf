variable "region" {
  default = "eu-west-1"
}

variable "volume_size" {
  default = "20"
}

variable "instance_profile_arn"{
  default = "secrets_manager_readonly"
}
