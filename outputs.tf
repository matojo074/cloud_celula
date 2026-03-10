output "vm_public_ip" {
  description = "IP publica de la maquina virtual"
  value       = azurerm_public_ip.public_ip.ip_address
}