output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.vnet_module_terraform.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.vnet_module_terraform.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.vnet_module_terraform.resource_group_id
  sensitive   = true
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.vnet_module_terraform.virtual_network_name
}

output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = module.vnet_module_terraform.virtual_network_id
  sensitive   = true
}

output "virtual_network_address_space" {
  description = "The address space of the virtual network"
  value       = module.vnet_module_terraform.virtual_network_address_space
}

output "subnet1_id" {
  description = "The ID of subnet1"
  value       = azurerm_subnet.subnet1.id
  sensitive   = true
}

output "subnet1_name" {
  description = "The name of subnet1"
  value       = azurerm_subnet.subnet1.name
}

output "subnet1_id_address_prefixes" {
  description = "The address prefixes of subnet1"
  value       = azurerm_subnet.subnet1.address_prefixes
}

output "network_security_group_name" {
  description = "The name of the network security group"
  value       = azurerm_network_security_group.terraform_nsg.name
}

output "public_ip_address" {
  description = "The IP address of the public IP"
  value       = azurerm_public_ip.terraform_public_ip.ip_address
}

output "public_ip_name" {
  description = "The name of the public IP"
  value       = azurerm_public_ip.terraform_public_ip.name
}

output "nic_public_ip_id" {
  description = "The ID of the public IP associated with the network interface"
  value       = azurerm_network_interface.terraform_nic.ip_configuration[0].public_ip_address_id
  sensitive   = true
}

output "nic_name" {
  description = "The name of the network interface"
  value       = azurerm_network_interface.terraform_nic.name
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_virtual_machine.terraform_vm.name
}

output "vm_size" {
  description = "The size of the virtual machine"
  value       = azurerm_virtual_machine.terraform_vm.vm_size
}
