variable "location" {}

variable "resource_group" {}

variable "sqlserver_name" {}

variable "sku_name" {
  default = "B_Gen5_2"
}

variable "storage_mb" {
  default = 5120
}

variable "admin_username" {
  default = "psqladmin"
}

variable "admin_password" {
  default = "H@Sh1CoR3!"
}

variable "sqlserver_version" {
  default = "9.5"
}

variable "sqldb_name" {}