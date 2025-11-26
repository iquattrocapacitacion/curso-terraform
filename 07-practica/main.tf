# Comandos útiles
# terraform state list # listar los recursos que se encutran en el estado
# terraform state show azurerm_resource_group.terraform-rg # detalle de un recursos especifico
# terraform taint azurerm_resource_group.terraform-rg # reconstruir un recurso
# terraform untaint azurerm_resource_group.terraform-rg # desmarcar el recreado
# recrear un recurso específico
# terraform plan -replace="azurerm_resource_group.terraform-rg"
# terraform apply -replace="azurerm_resource_group.terraform-rg"

resource "azurerm_resource_group" "terraform-rg" {
  name     = "dalvinder-rg"
  location = "eastus"
}

# terraform import
# terraform import <recurso_declarado> <ID_del_recurso_en_el_proveedor>
# terraform import azurerm_virtual_network.manual-vnet /subscriptions/62cdd463-fc5c-4eb4-9a1a-139e02f0e84e/resourceGroups/dalvinder-rg/providers/Microsoft.Network/virtualNetworks/dalvinder-vnet
resource "azurerm_virtual_network" "manual-vnet" {
  name                = "dalvinder-vnet"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.terraform-rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    Owner = "Dalvinder"
  }
}
