resource "azurerm_virtual_network" "main" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "bhavya-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  resource_group_name = "B17_G17_Bhavya"
}

resource "azurerm_subnet" "internal" {
  depends_on           = [azurerm_resource_group.rg]
  name                 = "internal"
  resource_group_name  = "B17_G17_Bhavya"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "main-nic"
  location            = "centralindia"
  resource_group_name = "B17_G17_Bhavya"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ippublic.id
  }
}

resource "azurerm_virtual_machine" "main" {
  depends_on            = [azurerm_resource_group.rg]
  name                  = "main-vm"
  location              = "centralindia"
  resource_group_name   = "B17_G17_Bhavya"
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azurerm_public_ip" "ippublic" {
  name                = "publicip"
  resource_group_name = "B17_G17_Bhavya"
  location            = "centralindia"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
