variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
}

variable "location" {
  description = "Región donde se creará el Resource Group"
  type        = string
}

variable "vm_name" {
  default = "vm-cloud"
}

variable "admin_username" {
  default = "clouduser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}