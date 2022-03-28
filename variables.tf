variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-1"
    "us-east-2" = "ami-2"
  }
}

variable "cdirs_remote_access" {
  type = list(any)
  default = [
      "192.168.0.1/32"
  ]
}

variable "key_name" {
  default = "terraform_aws"
}
