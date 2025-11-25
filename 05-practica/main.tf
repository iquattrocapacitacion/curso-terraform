resource "azurerm_resource_group" "terraform_rg" {
  name     = "dalvinder-rg"
  location = var.location
}

module "vnet" {
  source  = "Azure/vnet/azurerm" # Consuno desde Modules de Terraform
  version = "5.0.1"
  # insert the 2 required variables here
  resource_group_name = azurerm_resource_group.terraform_rg.name
  vnet_location       = var.location
  subnet_names        = ["subnetA", "subnetB"]
  subnet_prefixes     = ["10.0.10.0/24", "10.0.20.0/24"]
  vnet_name           = "dalvinder-vnet"
}

module "vnet-github" {
  source              = "github.com/Azure/terraform-azurerm-vnet"
  vnet_location       = var.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
}

# Comentarios de una linea
// Comentario de una linea
/*
Bloque de comentarios
puede haber un párrafo
*/
