# rgroup
output "rg_name" {
  value = module.rgroup.rg.name
}

# network
output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet1_name
}

# common
output "la_workspace" {
  value = module.common.la_workspace
}

output "recovery_vault" {
  value = module.common.recovery_vault
}

output "storage_account" {
  value = module.common.storage_account
}

# vmlinux
output "linux_avs_name" {
  value = module.vmlinux.linux_avs_name
}

output "linux_name" {
  value = module.vmlinux.linux_name
}

output "linux_fqdn" {
  value = module.vmlinux.linux_fqdn
}

output "linux_dns_label" {
  value = module.vmlinux.linux_dns_label
}

output "linux_private_ip" {
  value = module.vmlinux.linux_private_ip
}

output "linux_public_ip" {
  value = module.vmlinux.linux_public_ip
}

# vmwindows
output "windows_name" {
  value = module.vmwindows.windows_name
}

output "windows_fqdn" {
  value = module.vmwindows.windows_fqdn
}

output "windows_dns_label" {
  value = module.vmwindows.windows_dns_label
}

output "windows_private_ip" {
  value = module.vmwindows.windows_private_ip
}

output "windows_public_ip" {
  value = module.vmwindows.windows_public_ip
}

# loadbalancer
output "loadbalancer_name" {
  value = module.loadbalancer.a1lb
}

#database
output "db_name" {
  value = module.database.sqldb
}