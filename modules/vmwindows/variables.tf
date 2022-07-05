variable "resource_group" {}

variable "location" {}

variable "subnet1_id" {}

variable "windows_admin_username" {
    default = "Bo-N01529579"
}

variable "windows_admin_password" {
    default = "Bo-N01529579"
}

variable "windows_storage_account_type" {
    default = "StandardSSD_LRS"
}

variable "windows_disk_size_gb" {
    default = "128"
}

variable "windows_caching" {
    default = "ReadWrite"
}

variable "windows_publisher" {
    default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
    default = "WindowsServer"
}

variable "windows_sku" {
    default = "2016-Datacenter"
}

variable "windows_version" {
    default = "latest"
}

variable "blob_endpoint" {}

variable "windows_avs_name" {
  default = "windows_avs"
}

variable "windows_name" {
    type = map(string)
    default = {
    }
}

variable "fault_domain_count" {
  default = 2
}

variable "update_doamin_count" {
  default = 5
}

variable "vm_extension_name" {}

variable "vm_extension_publisher" {
  default = "Microsoft.Azure.Security.AntimalwareSignature"
}

variable "vm_extension_type" {
  default = "AntimalwareConfiguration"
}

variable "vm_extension_version" {
  default = "2.0"
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Bo Liu"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}