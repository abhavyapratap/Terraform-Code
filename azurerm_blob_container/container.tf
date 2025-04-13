resource "azurerm_storage_container" "container" {
  name                  = "pandacontainer"
  storage_account_id    = "/subscriptions/1f43e7c1-4e8a-4da0-877f-76b7cb3e5898/resourceGroups/panda-rg//providers/Microsoft.Storage/storageAccounts/pandastorageacc"
  container_access_type = "private"
}