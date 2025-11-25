output "vnet_address_space" {
  description = "VNet Name"
  value       = module.vnet.vnet_address_space
}

output "vnet_address_space_github" {
  description = "VNet Name Github"
  value       = module.vnet-github.vnet_address_space
}
