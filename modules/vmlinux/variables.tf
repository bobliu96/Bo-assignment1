variable "resource_group" {}

variable "location" {}

variable "subnet1_id" {}

variable "linux_name" {}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "vm_admin_username" {
  default = "Bo-N01529579"
}

variable "vm_admin_password" {
  default = "Bo-N01529579"
}

variable "vm_storage_account_type" {
  default = "Premium_LRS"
}

variable "vm_disk_size_gb" {
  default = "32"
}

variable "vm_caching" {
  default = "ReadWrite"
}

variable "vm_publisher" {
  default = "OpenLogic"
}

variable "vm_offer" {
  default = "CentOS"
}

variable "vm_sku" {
  default = "8_2-gen2"
}

variable "vm_version" {
  default = "latest"
}

locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Bo Liu"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}

variable "blob_endpoint" {}

variable "avs_name" {}

variable "nb_count" {}

variable "fault_domain_count" {
  default = "2"
}

variable "update_domain_count" {
  default = "5"
}

variable "ssh_pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key" {
  default = "~/.ssh/id_rsa"
}

variable "vm_extension_name" {}

variable "vm_extension_publisher" {
  default = "Microsoft.Azure.NetworkWatcher"
}

variable "vm_extension_type" {
  default = "NetworkWatcherAgentLinux"
}

variable "vm_extension_version" {
  default = "1.4"
}
