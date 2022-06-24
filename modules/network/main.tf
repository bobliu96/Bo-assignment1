resource "azurerm_virtual_network" "network-vnet" {
  name                = var.network-vnet
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.network-vnet_space
}

resource "azurerm_subnet" "network-subnet1" {
  name                 = var.network-subnet1
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = var.network-subnet1_space
}

resource "azurerm_network_security_group" "network-nsg1" {
  name                = var.network-nsg1
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "network-nsga" {
  subnet_id                 = azurerm_subnet.network-subnet1.id
  network_security_group_id = azurerm_network_security_group.network-nsg1.id
}