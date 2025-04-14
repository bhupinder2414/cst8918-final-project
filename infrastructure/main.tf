
provider "azurerm" {
  features {}
  subscription_id = "b3a5e2d7-0dbd-4996-a04c-aabf9261dc55" # ID
}


terraform {
  backend "azurerm" {
    resource_group_name  = "cst8918-tfstate-rg"
    storage_account_name = "cst8918tfstate04"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}


module "aks" {
  source = "./aks"
}