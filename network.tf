resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-${var.env}-${var.lab_id}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.azure-vnet}"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-${var.lab_id}-snet-aks"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.azure-snet1}"]
}

resource "azurerm_subnet" "subnet_ingress" {
  name                 = "${var.prefix}-${var.lab_id}-snet-ingress"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.azure-snet2}"]
}
