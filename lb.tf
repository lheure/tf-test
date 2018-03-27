resource "azurerm_public_ip" "s1uw2-ielb-papi-pip" {
  name                         = "s1uw2-ielb-papi-pip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.rg-01.name}"
  public_ip_address_allocation = "static"
}

resource "azurerm_lb" "s1uw2-ielb-papi" {
  name                = "s1uw2-ielb-papi"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg-01.name}"

  frontend_ip_configuration {
    name                 = "s1uw2-ielb-papi-ipconf"
    public_ip_address_id = "${azurerm_public_ip.s1uw2-ielb-papi-pip.id}"
  }
}

resource "azurerm_lb_backend_address_pool" "s1uw2-ielb-papi-bpool" {
  resource_group_name = "${azurerm_resource_group.rg-01.name}"
  loadbalancer_id     = "${azurerm_lb.s1uw2-ielb-papi.id}"
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "s1uw2-ielb-papi-probe" {
  resource_group_name = "${azurerm_resource_group.rg-01.name}"
  loadbalancer_id     = "${azurerm_lb.s1uw2-ielb-papi.id}"
  name                = "s1uw2-ielb-papi-probe"
  port                = 10080
}

resource "azurerm_lb_rule" "s1uw2-ielb-papi-rule" {
  resource_group_name            = "${azurerm_resource_group.rg-01.name}"
  loadbalancer_id                = "${azurerm_lb.s1uw2-ielb-papi.id}"
  name                           = "s1uw2-ielb-papi-rule"
  protocol                       = "Tcp"
  frontend_port                  = 10080
  backend_port                   = 10080
  frontend_ip_configuration_name = "s1uw2-ielb-papi-ipconf"
  enable_floating_ip             = false
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.s1uw2-ielb-papi-bpool.id}"
  idle_timeout_in_minutes        = 5
  probe_id                       = "${azurerm_lb_probe.lb_probe.id}"
  depends_on                     = ["azurerm_lb_probe.lb_probe"]
}
