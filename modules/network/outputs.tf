output "vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "subnet1_name" {
  value = azurerm_subnet.network-subnet1.name
}

output "subnet1_id" {
  value = azurerm_subnet.network-subnet1.id
}
