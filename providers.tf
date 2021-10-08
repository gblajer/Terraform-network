terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.77.0"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "1.1.3"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.sub_id
}
