# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {

  required_version = "1.9.7"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=4.3.0"
    }
    random = {
      source = "hashicorp/random"
      version = "=3.4.3"
    } 
  }
  backend "azurerm" {
    resource_group_name  = "rg-focus-demo-tfstate"
    storage_account_name = "stfocusdemotfstate"
    container_name       = "demowebapp"
    key                  = "terraform.tfstate"
  }
}

# Define default provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Declare an aliased provider block using your preferred configuration.
# This will be used for the deployment of all "Management resources" to the specified `subscription_id`.

data "azurerm_client_config" "current" {}