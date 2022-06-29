variable "lb_name" {}

variable "location" {}

variable "resource_group" {}

variable "frt_ip_config" {
  default = "frt-ip-config"
}

variable "pip_name" {
  default = "lbpip"
}

variable "dns_label" {
  default = "lb-dns"
}

variable "lbpool_name" {
  default = "BackEndAddressPool"
}

variable "nic_name" {
 default =  "lb-nic"
}

variable "ip_config_name" {
  default = "lb-ipconfig"
}

variable "lb_rule_name" {
  default = "LBrule"
}

variable "lb_probe_name" {
  default = "ssh-running-probe"
}

variable "subnet1_id" {}

variable "nic_id1" {
  
}

variable "nic_id2" {
  
}