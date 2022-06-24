resource "azurerm_managed_disk" "datadisk" {
  for_each             = var.vm_id
  name                 = "${each.key}-managed-disk"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = var.datadisk_type
  create_option        = var.datadisk_create_option
  disk_size_gb         = var.datadisk_size
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_vm" {
  for_each           = var.vm_id
  managed_disk_id    = azurerm_managed_disk.datadisk[each.key].id
  virtual_machine_id = var.vm_id[each.key]
  lun                = var.datadisk_lun
  caching            = var.datadisk_caching
}