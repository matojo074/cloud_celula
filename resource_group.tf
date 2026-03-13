resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}"
  location = var.location
  tags = {
    project     = var.prefix
    environment = var.env
    lab_id      = var.lab_id
  }
}