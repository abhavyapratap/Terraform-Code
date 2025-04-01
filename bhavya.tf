resource "azurerm_public_ip" "ippublic" {
  name                = "publicip"
  resource_group_name = "B17_G17_Bhavya"
  location            = "centralindia"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}