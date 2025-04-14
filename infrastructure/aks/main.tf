data "azurerm_resource_group" "main" {
  name = "cst8918-final-project-group-04"
}

data "azurerm_subnet" "test" {
  name                 = "subnet-test"
  virtual_network_name = "vnet-main"
  resource_group_name  = data.azurerm_resource_group.main.name
}

data "azurerm_subnet" "prod" {
  name                 = "subnet-prod"
  virtual_network_name = "vnet-main"
  resource_group_name  = data.azurerm_resource_group.main.name
}

# 测试环境 AKS 集群
resource "azurerm_kubernetes_cluster" "test" {
  name                = "aks-test"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = "akstest"
  kubernetes_version  = "1.29.15"

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = data.azurerm_subnet.test.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "172.16.0.0/16"
    dns_service_ip    = "172.16.0.10"
  }

  tags = {
    Environment = "test"
  }
}

# 生产环境 AKS 集群
resource "azurerm_kubernetes_cluster" "prod" {
  name                = "aks-prod"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.main.name
  dns_prefix          = "aksprod"
  kubernetes_version  = "1.29.15"

  default_node_pool {
    name                = "default"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
    vm_size             = "Standard_B2s"
    vnet_subnet_id      = data.azurerm_subnet.prod.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "172.16.0.0/16"
    dns_service_ip    = "172.16.0.10"
  }

  tags = {
    Environment = "prod"
  }
}