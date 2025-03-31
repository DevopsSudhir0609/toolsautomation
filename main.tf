module "vm" {
  source    = "./Vm-module"
  for_each  = var.tools
  component = each.key
  username  = var.username
  password  = var.password
  Port      = each.value.Port
}

variable "tools" {
  default = {
    "vault" = {
      Port = 8200
    }
    default={
      "github-runner"={
        port=443
      }
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Project-Alpha"
    storage_account_name = "projectalpha13"
    container_name       = "toolsautomation"
    key                  = "terraform.tfstate"

  }
}
