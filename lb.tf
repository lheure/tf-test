resource "azurerm_public_ip" "s1uw2-elb-ccnoti-pip" {
  name                         = "s1uw2-elb-ccnoti-pip"
  location                     = ${var.location}
  resource_group_name          = ${azurerm_resource_group.rg-01.name}
  public_ip_address_allocation = "static"
}

resource "azurerm_lb" "s1uw2-elb-ccnoti" {
  name                = "s1uw2-elb-ccnoti"
  location            = ${var.location}
  resource_group_name = ${azurerm_resource_group.rg-01.name}

  frontend_ip_configuration {
    name                 = "s1uw2-elb-ccnoti-ipconf"
    public_ip_address_id = "${azurerm_public_ip.s1uw2-elb-ccnoti-pip.id}"
  }
}