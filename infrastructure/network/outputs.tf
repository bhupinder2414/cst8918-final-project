output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = {
    prod  = azurerm_subnet.prod.id
    test  = azurerm_subnet.test.id
    dev   = azurerm_subnet.dev.id
    admin = azurerm_subnet.admin.id
  }
}

output "network_resource_group_name" {
  value = module.network.resource_group_name
}

output "network_subnet_ids" {
  value = module.network.subnet_ids
}