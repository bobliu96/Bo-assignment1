output "windows_name" {
  value = [values(azurerm_windows_virtual_machine.winvm)[*].name]
}

output "windows_id" {
  value = [values(azurerm_windows_virtual_machine.winvm)[*].id]
}

output "windows_fqdn" {
  value = [values(azurerm_public_ip.winpip)[*].fqdn]
}

output "windows_dns_label" {
  value = [values(azurerm_public_ip.winpip)[*].domain_name_label]
}

output "windows_private_ip" {
  value = [values(azurerm_windows_virtual_machine.winvm)[*].private_ip_address]
}

output "windows_public_ip" {
  value = [values(azurerm_windows_virtual_machine.winvm)[*].public_ip_address]
}