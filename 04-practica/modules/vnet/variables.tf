variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
}

variable "prefix_name" {
  description = "The prefix name for resources"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "terraform-project"
}
