terraform {
  backend "remote" {
      hostname = "app.terraform.io"
      organization = "tosale"
      workspaces {
        name = "aws-tosale"
      }
  }
}