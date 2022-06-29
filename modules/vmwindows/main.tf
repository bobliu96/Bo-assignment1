resource "azurerm_network_interface" "winnic" {
  name                = "${each.key}-nic"
  for_each            = var.windows_name
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    public_ip_address_id          = azurerm_public_ip.winpip[each.key].id
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_public_ip" "winpip" {
  name                    = "${each.key}-pip"
  for_each                = var.windows_name
  location                = var.location
  resource_group_name     = var.resource_group
  domain_name_label       = "${each.key}-dns"
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  tags                    = local.common_tags

}

resource "azurerm_windows_virtual_machine" "winvm" {
  name                            = each.key
  for_each                        = var.windows_name
  computer_name                   = each.key
  resource_group_name             = var.resource_group
  location                        = var.location
  size                            = each.value
  admin_username                  = var.windows_admin_username
  admin_password                  = var.windows_admin_password
  availability_set_id = azurerm_availability_set.winavs.id
  network_interface_ids = [
    azurerm_network_interface.winnic[each.key].id
  ]
  tags = local.common_tags

  os_disk {
    name                 = "${each.key}-os-disk"
    disk_size_gb         = var.windows_disk_size_gb
    caching              = var.windows_caching
    storage_account_type = var.windows_storage_account_type
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.blob_endpoint
  }

}

resource "azurerm_availability_set" "winavs" {
  name                = var.windows_avs_name
  location            = var.location
  resource_group_name = var.resource_group
  platform_fault_domain_count = var.fault_domain_count
  platform_update_domain_count = var.update_doamin_count
  tags                = local.common_tags
}
