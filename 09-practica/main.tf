# Workflow
# Write => Init => Plan => Apply => Destroy
# terraform apply --auto-approve # Se utiliza para una confirmación automática de apply o destroy
# terraform refresh # refrescar los cambios que se pudieron haber hecho directamente desde el portal
# terraform plan -refresh-only # me muestra cambios manuales sin integrarlos al estado


resource "azurerm_resource_group" "rg" {
  name     = "dalvinder-rg-${terraform.workspace}"
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
