module "vm" {
  source = "./Vm-module"
  for_each = var.tools
  component = each.key
  username= each.value.username
  password = each.value.password
  Port     = each.value["Port"]
}

variable "tools" {
  type = map(object({
    
  }))
  default = {
    "vault" = {
      Port = 8200
  
}
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = "proect-Aplha"
    storage_account_name = "projectalpha13"
    container_name       = "toolsautomation"
    key                  = "terraform.tfstate"
    
  }
}
