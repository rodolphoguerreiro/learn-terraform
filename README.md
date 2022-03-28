# API-REST

#### Requirements
* Terraform >= 0.12.13

## Installation Asdf to manage versions terraform

* Link Download Asdf :
https://asdf-vm.com/guide/getting-started.html#_2-download-asdf

**Add lines in .bash_aliases :**
```sh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
```
**Run the command below to install a specific version of terraform  :**
```sh
# Add plugin terraform in list to asdf
$ asdf plugin add terraform

# Install specific version
$ asdf install terraform 0.12.13

# Set version
$ asdf local terraform 0.12.13

# Chech version with
$ terraform -v
```

## Settings .terraformrc
In ~/.terraformrc set token generated in https://app.terraform.io/app/settings/tokens
```sh
credentials "app.terraform.io" {
    token = "xxxxxxxx.XXXXXXXXXX.xxxxxxxxxxx"
}
```