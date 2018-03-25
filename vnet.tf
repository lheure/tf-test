# Create virtual network
resource "azurerm_virtual_network" "vnet-01" {
    name                = "${var.prefix}-vnet-01"
    address_space       = ["10.200.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg-01.name}"

    tags {
        environment = "${var.tag}"
    }
}

# Create virtual network
resource "azurerm_virtual_network" "vnet-02" {
    name                = "${var.prefix}-vnet-02"
    address_space       = ["20.200.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg-01.name}"

    tags {
        environment = "${var.tag}"
    }
}
