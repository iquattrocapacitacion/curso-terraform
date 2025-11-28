terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-state-dalvinder"
    storage_account_name = "sacstate73361"
    container_name       = "tfstate"
    key                  = "cloud/terraform.tfstate"
  }

  # terraform init -migrate-state # ejecutar migración de estado
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}

# provider "azurerm" {
#   features {}
# }
