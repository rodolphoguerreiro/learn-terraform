/*
Terraform commands:
terraform plan      : Validate script
terraform show      : Show settings
terraform validate  : Validate script
terraform init      : Init settings
terraform apply     : Run commands in aws
terraform destroy   : Remove all settings in aws
terraform destroy -target aws_s3_bucket.dev4 : To destroy bucket dev4 and instance aws_instance.dev4
  - After run this command destroy, comment the creation command in here
terraform refresh   : After provisioning arquitecture in aws, this command refreshing all instances and show output configured
*/

provider "aws" {
  version = "~>2.0"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "us-east-2"
  version = "~>2.0"
  region  = "us-east-2"
}

// Crete instance
//       |type        | |name|
resource "aws_instance" "dev" {
  ami           = var.amis["us-east-1"]
  count         = 3
  instance_type = "t2.micro"      //free plan
  key_name      = var.key_name //ssh key imported in aws
  tags = {
    Name = "dev ${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.access_ssh.id}"] //get aws_security_group.access_ssh by reference
}

resource "aws_instance" "dev4" { //link to bucket dev4
  ami           = var.amis["us-east-1"]
  instance_type = "t2.micro"      //free plan
  key_name      = var.key_name //ssh key imported in aws
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.access_ssh.id}"] //get aws_security_group.access_ssh by reference
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami           = var.amis["us-east-1"]
  instance_type = "t2.micro"      //free plan
  key_name      = var.key_name //ssh key imported in aws
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.access_ssh.id}"] //get aws_security_group.access_ssh by reference
}

resource "aws_instance" "dev6" {
  provider      = "aws.us-east-2"
  ami           = var.amis["us-east-2"]
  instance_type = "t2.micro"      //free plan
  key_name      = var.key_name //ssh key imported in aws
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.access_ssh-us-east-2.id}"] //get aws_security_group.access_ssh by reference
  depends_on = [
    aws_dynamodb_table.dynamo-developer
  ]
}

resource "aws_instance" "dev7" {
  provider      = aws.us-east-2
  ami           = var.amis["us-east-2"]
  instance_type = "t2.micro"      //free plan
  key_name      = var.key_name //ssh key imported in aws
  tags = {
    Name = "dev7"
  }
  vpc_security_group_ids = ["${aws_security_group.access_ssh-us-east-2.id}"] //get aws_security_group.access_ssh by reference
}

resource "aws_s3_bucket" "dev4" {
  bucket = "lab-dev4"
  acl    = "private"
  tags = {
    Name = "lab-dev4"
  }
}
