output "resource_group_name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Storage Account Name"
  value       = azurerm_storage_account.sa.name
}

output "container_name" {
  description = "Container Name"
  value       = azurerm_storage_container.sc.name
}
