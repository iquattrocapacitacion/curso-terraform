resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_account" "sa" {
  name                     = "sacstate${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = false
  }

  tags = local.common_tags
}

resource "azurerm_storage_encryption_scope" "ses" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.sa.id
  source             = "Microsoft.Storage"
}

resource "azurerm_storage_container" "sc" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}
