variable "resource_group" {}

variable "location" {}

variable "workspace_name" {}

variable "workspace_sku" {
  default = "PerGB2018"
}

variable "retention" {
  default = "30"
}

variable "recovery_name" {}

variable "recovery_sku" {
  default = "Standard"
}

variable "storage_account_name" {}

variable "account_tier" {
  default = "Standard"
}

variable "replication_type" {
  default = "LRS"
}