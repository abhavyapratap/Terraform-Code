terraform {
  backend "azurerm" {
    resource_group_name = "panda-rg"
    storage_account_name = "pandastorageacc"
    container_name = "pandacontainer"
    key = "panda.tfstate"
    
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}