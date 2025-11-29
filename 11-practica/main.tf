resource "azurerm_resource_group" "rg" {
  name     = "dalvinder-rg"
  location = "eastus"
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.common_tags
  address_space       = var.address_space
}
