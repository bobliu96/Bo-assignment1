resource "azurerm_postgresql_server" "sqlserver" {
  name                = var.sqlserver_name
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = var.sqlserver_version
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "sqldb" {
  name                = var.sqldb_name
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.sqlserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}