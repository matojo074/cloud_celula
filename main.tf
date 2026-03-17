#version de terraform  y azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
}
#creacion de los recursos
resource "azurerm_resource_group" "rg" {
  name     = "rg-e12"
  location = "eastus"

}

#configuracion del networking
resource "azurerm_virtual_network" "vnetaks" {
  name                = "vnet-aks-e12"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.62.0.0/16"]
}
resource "azurerm_subnet" "snetaks" {
  name                              = "snet-aks-e12"
  resource_group_name               = azurerm_resource_group.rg.name
  virtual_network_name              = azurerm_virtual_network.vnetaks.name
  address_prefixes                  = ["10.62.1.0/24"]
  private_endpoint_network_policies = "Enabled"
}
resource "azurerm_subnet" "snet_ingress" {
  name                 = "snet-ingress-e12"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnetaks.name
  address_prefixes     = ["10.62.2.0/24"]
}

#despliegue del aks
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-e12"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "AKS-e12"

  default_node_pool {
    name           = "pool"
    vm_size        = "Standard_DS2_v2"
    node_count     = 2
    vnet_subnet_id = azurerm_subnet.snetaks.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }
}
