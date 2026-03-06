provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  count    = var.enabled ? 1 : 0
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "azurerm_virtual_network" "main" {
  count               = var.enabled ? 1 : 0
  name                = "${var.project_name}-${var.environment}-vnet"
  location            = azurerm_resource_group.main[0].location
  resource_group_name = azurerm_resource_group.main[0].name
  address_space       = [var.vnet_cidr]

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "azurerm_subnet" "main" {
  count                = var.enabled ? 1 : 0
  name                 = "${var.project_name}-${var.environment}-subnet"
  resource_group_name  = azurerm_resource_group.main[0].name
  virtual_network_name = azurerm_virtual_network.main[0].name
  address_prefixes     = [var.subnet_cidr]
}
