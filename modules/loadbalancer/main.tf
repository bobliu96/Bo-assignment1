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

resource "azurerm_network_interface" "lbnic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_network_interface_backend_address_pool_association" "lbpoola" {
  network_interface_id    = azurerm_network_interface.lbnic.id
  ip_configuration_name   = var.ip_config_name
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
