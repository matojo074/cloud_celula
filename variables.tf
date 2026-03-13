variable "prefix" {
  description = "Prefijo de estudiante"
  type = string
  default = "demo-aks-e12"
}

#variable "resource_group_name" {
#  description = "Nombre del Resource Group"
#  type        = string
#  default = "rg-e12"
#}

variable "location" {
  description = "Región donde se creará el Resource Group"
  type        = string
  default = "eastus"
}

#variable "addres-space-vnet" {
#  description = "vnet cidr"
#  type = string
#  default = "10.62.0.0/16"
#}

#variable "addres-space-subnet" {
#  description = "subnet cidr"
#  type = string
#  default = "10.62.0.0/24"
#}

#variable "address-space-snet-ingress" {
#  description = "snet cidr"
#  type        = string
#  default     = "10.62.1.0/24"
#}

variable "env" {
  description = "Entorno de trabajo"
  type = string
  default = "dev"
}

#variable "lab_id" {
#  description = "Identidad estudiante"
#  type = string
#  default = "lab12"
#}