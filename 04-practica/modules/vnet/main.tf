resource "azurerm_resource_group" "terraform_rg" {
  name     = "${var.prefix_name}-${var.environment}-rg"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "${var.prefix_name}-${var.environment}-vnet"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  tags                = local.common_tags
}
