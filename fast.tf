terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1f43e7c1-4e8a-4da0-877f-76b7cb3e5898"
}

resource "azurerm_resource_group" "rg" {
  name     = "B17_G17_Bhavya"
  location = "centralindia"
}

resource "azurerm_resource_group" "rg1" {
  name     = "B17_G17_Taksh"
  location = "centralindia"
}

resource "azurerm_storage_account" "storage" {
  name                     = "abcdstorage1234"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}