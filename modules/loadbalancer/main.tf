resource "azurerm_lb" "a1lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group
  frontend_ip_configuration {
    name                 = var.frt_ip_config
    public_ip_address_id = azurerm_public_ip.lbpip.id
  }
}

resource "azurerm_public_ip" "lbpip" {
  name                    = var.pip_name
  location                = var.location
  resource_group_name     = var.resource_group
  domain_name_label       = var.dns_label
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

}

resource "azurerm_lb_backend_address_pool" "lbpool" {
  loadbalancer_id = azurerm_lb.a1lb.id
  name            = var.lbpool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "lbpoola" {
  network_interface_id    = var.nic_id1
  ip_configuration_name   = "a1-9579-linux-vm-ipconfig1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbpool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lbpoola2" {
  network_interface_id    = var.nic_id2
  ip_configuration_name   = "a1-9579-linux-vm-ipconfig2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbpool.id
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.a1lb.id
  name                           = var.lb_rule_name
  protocol                       = "Tcp"
  frontend_port                  = 222
  backend_port                   = 222
  frontend_ip_configuration_name = var.frt_ip_config
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.a1lb.id
  name            = var.lb_probe_name
  port            = 222
}
