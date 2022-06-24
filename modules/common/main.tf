resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.workspace_sku
  retention_in_days   = var.retention
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.recovery_sku
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}