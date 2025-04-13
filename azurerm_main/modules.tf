module "rg" {
    source = "../azurerm_resource_group"
}

module "storage" {
    depends_on = [ module.rg ]
    source = "../azurerm_storage_acc"
}

module "container" {
    depends_on = [ module.storage ]
    source = "../azurerm_blob_container"
}