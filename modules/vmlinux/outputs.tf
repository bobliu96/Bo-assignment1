output "linux_avs_name" {
  value = azurerm_availability_set.avs.name
}

output "linux_name" {
  value = [azurerm_linux_virtual_machine.vm[*].name]
}

output "linux_id" {
  value = [azurerm_linux_virtual_machine.vm[*].id]
}

output "linux_pip_id" {
  value = [azurerm_public_ip.pip[*].id]
}

output "linux_fqdn" {
  value = [azurerm_public_ip.pip[*].fqdn]
}

output "linux_dns_label" {
  value = [azurerm_public_ip.pip[*].domain_name_label]
}

output "linux_private_ip" {
  value = [azurerm_linux_virtual_machine.vm[*].private_ip_address]
}

output "linux_public_ip" {
  value = [azurerm_linux_virtual_machine.vm[*].public_ip_address]
}

output "linux_nic_id" {
  value = [azurerm_network_interface.nic[*].id]
}
