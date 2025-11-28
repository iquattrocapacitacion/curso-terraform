output "vnet_name" {
  description = "VNet Name"
  value       = azurerm_virtual_network.vnet.name
}

output "resource_group_name" {
  description = "RG Name"
  value       = azurerm_resource_group.rg.name
}
