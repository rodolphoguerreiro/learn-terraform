resource "aws_security_group" "access_ssh" {
  name        = "access_ssh"
  description = "Allow access ssh"
  
  ingress {
    #TLS (change to whatever ports yuou need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_access
  }

  tags = {
    "Name" = "ssh"
  }
}

resource "aws_security_group" "access_ssh-us-east-2" {
  provider    = aws.us-east-2
  name        = "access_ssh"
  description = "Allow access ssh"
  
  ingress {
    #TLS (change to whatever ports yuou need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_access
  }

  tags = {
    "Name" = "ssh"
  }
}
