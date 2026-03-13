resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-${var.env}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.62.0.0/16"]
  tags = {project = var.prefix }
}

# Subred para los nodos/pods de AKS
resource "azurerm_subnet" "snet-aks" {
  name                              = "${var.prefix}-snet-aks"
  resource_group_name               = azurerm_resource_group.rg.name
  virtual_network_name              = azurerm_virtual_network.vnet.name
  address_prefixes                  = ["10.62.0.0/24"]
  private_endpoint_network_policies = "Enabled"
}
 
# Subred para ingress
resource "azurerm_subnet" "snet-ingress" {
  name                              = "${var.prefix}-snet-ingress"
  resource_group_name               = azurerm_resource_group.rg.name
  virtual_network_name              = azurerm_virtual_network.vnet.name
  address_prefixes                  = ["10.62.1.0/24"]
  private_endpoint_network_policies = "Enabled"
}