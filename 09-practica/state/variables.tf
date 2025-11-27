variable "resource_group_name" {
  description = "Name of Resource Group where we put the romete backend."
  type        = string
  default     = "rg-tf-state-dalvinder"
}

variable "location" {
  description = "Resources Region"
  type        = string
  default     = "eastus"
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "tfstate"
}
