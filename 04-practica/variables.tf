variable "location" {
  description = "The location where resources will be deployed."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "terraform-rg-dalvinder"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "terraform-vnet-dalvinder"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "owner" {
  description = "The owner of the resources."
  type        = string
  default     = "Dalvinder"
}

variable "prefix_name" {
  description = "The prefix name for resources."
  type        = string
  default     = "dalvinder"
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, prod)."
  type        = string
  default     = "qa"
}
