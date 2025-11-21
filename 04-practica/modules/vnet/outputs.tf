output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.terraform_rg.id
  sensitive   = true
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.terraform_rg.location
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.terraform_rg.name
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.terraform_vnet.name
}

output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.terraform_vnet.id
  sensitive   = true
}

output "virtual_network_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.terraform_vnet.address_space
}
