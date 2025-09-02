terraform {
    backend "azurerm" {
        resource_group_name = "sunil_rg"
        storage_account_name = "sunilstg2025"
        container_name = "container2025"
        key = "rg.terraform.tfstate"
    }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }

}

provider "azurerm" {
  features {}
  subscription_id = "76095b6e-0585-402e-8e43-281835aebfd1"
}