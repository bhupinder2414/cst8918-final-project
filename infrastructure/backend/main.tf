provider "azurerm" {
  features {}
  subscription_id = "ee39387e-4892-429d-aeb2-ca4f142fbd25"
}

module "backend" {
  source       = "./backend"
  location     = "Canada Central"
  group_number = var.group_number   # Replace with your Brightspace group number (e.g., "01")
}

resource "azurerm_resource_group" "backend" {
  name     = "cst8918-tfstate-rg"
  location = var.location
}

resource "azurerm_storage_account" "backend" {
  name                     = "cst8918tfstate${var.group_number}"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}