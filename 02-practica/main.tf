provider "azurerm" {
  # Configuration options
  subscription_id = "62cdd463-fc5c-4eb4-9a1a-139e02f0e84e"
  features {}
}

resource "azurerm_resource_group" "rg_terraform" {
  name     = var.rg_name
  location = var.ubicacion
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "vnet_terraform" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  address_space       = var.segmento_vnet
  # location            = "East US"
  # resource_group_name = "Recursos_Dalvinder_Salinas"
  tags = var.common_tags
  # depends_on = [ azurerm_resource_group.rg_terraform ]
}

resource "azurerm_subnet" "subnet_1_terraform" {
  name                 = "${var.subnet_prefix}-1"
  resource_group_name  = azurerm_resource_group.rg_terraform.name
  virtual_network_name = azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.segmento_subnets[0]]
  # depends_on = [
  #   azurerm_virtual_network.vnet_terraform,
  #   azurerm_resource_group.rg_terraform
  # ]
}

resource "azurerm_subnet" "subnet_2_terraform" {
  name                 = "${var.subnet_prefix}-2"
  resource_group_name  = azurerm_resource_group.rg_terraform.name
  virtual_network_name = azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.segmento_subnets[1]]
  # depends_on = [
  #   azurerm_virtual_network.vnet_terraform,
  #   azurerm_resource_group.rg_terraform
  # ]
}

# Buenas prácticas
# 1. Usar nombre claros
# 2. Utilizar variables para referenciar a los nombre
# 3. Usar tags
