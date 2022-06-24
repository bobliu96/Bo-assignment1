resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.vm_admin_username
      private_key = file(var.ssh_private_key)
      host        = element(azurerm_linux_virtual_machine.vm[*].public_ip_address, count.index + 1)
    }
  }
}
