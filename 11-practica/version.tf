terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "courses-terraform-11282025"
    workspaces {
      name = "dev"
    }
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
