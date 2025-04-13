resource "azurerm_storage_account" "storage" {
  name                     = "pandastorageacc"
  resource_group_name      = "panda-rg"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}