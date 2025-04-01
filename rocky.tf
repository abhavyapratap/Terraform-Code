terraform {
    backend "azurerm" {
        resource_group_name = "B17_G17_Bhavya"
        storage_account_name = "1911storage2525"
        container_name = "maincontainer"
        key = "remote.tfstate"
    }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}