output "la_workspace" {
  value = azurerm_log_analytics_workspace.la_workspace.name
}

output "recovery_vault" {
  value = azurerm_recovery_services_vault.recovery_vault.name
}

output "storage_account" {
  value = azurerm_storage_account.storage_account.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}