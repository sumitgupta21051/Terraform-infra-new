terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sumit"       # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "sumit123456" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "sumit123456" # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
  subscription_id = "76095b6e-0585-402e-8e43-281835aebfd1"
}