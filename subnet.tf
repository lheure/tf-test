variable v_virtual_network_name {
    default = "${azurerm_virtual_network.rg-01.name}"
}

variable v_resource_group_name {
    default = "${azurerm_resource_group.vnet-02.name}"
}

resource azurerm_subnet "sub-pri-fdbk-a" {
  name                 = "sub-pri-fdbk-a"
  virtual_network_name = "${v_virtual_network_name}
  resource_group_name  = "${v_resource_group_name}"
  address_prefix       = "10.200.60.0/24"
}


