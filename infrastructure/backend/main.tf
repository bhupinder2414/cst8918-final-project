provider "azurerm" {
  features {}
  subscription_id = "b3a5e2d7-0dbd-4996-a04c-aabf9261dc55" # 你的 Azure for Students 订阅 ID
}

resource "azurerm_resource_group" "backend" {
  name     = "cst8918-tfstate-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "backend" {
  name                     = "cst8918tfstate04"
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