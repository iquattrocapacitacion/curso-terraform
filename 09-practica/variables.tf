variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string
}

variable "address_space" {
  description = "This is the vnet address space"
  type        = list(string)
}
