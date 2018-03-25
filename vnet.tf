# Create virtual network
resource "azurerm_virtual_network" "tfvnet" {
    name                = "${var.prefix}-vnet"
    address_space       = ["10.200.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.vision-poc.name}"

    tags {
        environment = "${var.tag}"
    }
}