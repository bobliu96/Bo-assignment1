resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig${format("%1d", count.index + 1)}"
    public_ip_address_id          = element(azurerm_public_ip.pip[*].id, count.index + 1)
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_public_ip" "pip" {
  count                   = var.nb_count
  name                    = "${var.linux_name}-pip${format("%1d", count.index + 1)}"
  location                = var.location
  resource_group_name     = var.resource_group
  domain_name_label       = "${var.linux_name}-dns${format("%1d", count.index + 1)}"
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  tags                    = local.common_tags

}

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.nb_count
  name                            = "${var.linux_name}-${format("%1d", count.index + 1)}"
  computer_name                   = "${var.linux_name}-${format("%1d", count.index + 1)}"
  resource_group_name             = var.resource_group
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.vm_admin_username
  admin_password                  = var.vm_admin_password
  disable_password_authentication = "false"
  availability_set_id = element(azurerm_availability_set.avs[*].id, count.index + 1)
  network_interface_ids = [
    element(azurerm_network_interface.nic[*].id, count.index + 1)
  ]
  tags = local.common_tags

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    disk_size_gb         = var.vm_disk_size_gb
    caching              = var.vm_caching
    storage_account_type = var.vm_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file(var.ssh_pub_key)
  }

  boot_diagnostics {
    storage_account_uri = var.blob_endpoint
  }
}

resource "azurerm_availability_set" "avs" {
  name                         = var.avs_name
  location                     = var.location
  resource_group_name          = var.resource_group
  platform_fault_domain_count  = var.fault_domain_count
  platform_update_domain_count = var.update_domain_count
  tags                         = local.common_tags
}

resource "azurerm_virtual_machine_extension" "network-watcher" {
  count                      = var.nb_count
  name                       = var.vm_extension_name
  virtual_machine_id         = element(azurerm_linux_virtual_machine.vm[*].id, count.index + 1)
  publisher                  = var.vm_extension_publisher
  type                       = var.vm_extension_type
  type_handler_version       = var.vm_extension_version
  auto_upgrade_minor_version = true
}