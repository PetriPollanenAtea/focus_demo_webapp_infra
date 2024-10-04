terraform {
  backend "azurerm" {
    resource_group_name  = "rg-focus-demo-tfstate"
    storage_account_name = "stfocusdemotfstate"
    container_name       = "demowebapp"
    key                  = "terraform.tfstate"
  }


  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=4.3.0"
    }
  }
}

# Define default provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

data "azurerm_client_config" "current" {}
