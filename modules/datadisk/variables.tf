variable "location" {}

variable "resource_group" {}

variable "vm_id" {
  type    = map(string)
  default = {}
}

variable "datadisk_type" {
  default = "Standard_LRS"
}

variable "datadisk_create_option" {
  default = "Empty"
}

variable "datadisk_size" {
  default = 10
}

variable "datadisk_lun" {
  default = 0
}

variable "datadisk_caching" {
  default = "ReadWrite"
}

variable "playbook_path" {
  default = "'/Users/boboxu/Library/Mobile Documents/com~apple~CloudDocs/学习/Cloud Computing/5502 Automation/Terraform/Bo-assignment1/ansible/playbook.yml'"
}