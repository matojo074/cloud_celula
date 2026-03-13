variable "prefix" {
  description = "Prefijo de estudiante"
  type        = string
  default     = "e12"
}

variable "location" {
  description = "Región donde se creará el Resource Group"
  type        = string
  default     = "eastus"
}

variable "lab_id" {
  description = "Identacion estudiante"
  type        = string
  default     = "lab12"
}

variable "env" {
  description = "ambiente"
  type        = string
  default     = "dev"
}

variable "azure-vnet" {
  description = "vnet cidr"
  type        = string
  default     = "10.60.0.0/16"
}

variable "azure-snet1" {
  description = "snet1 cidr"
  type        = string
  default     = "10.60.0.0/24"
}

variable "azure-snet2" {
  description = "snet2 cidr"
  type        = string
  default     = "10.60.1.0/24"
}


#variable "vm_name" {
#  default = "vm-cloud"
#}

#variable "admin_username" {
#  default = "clouduser"
#}

#variable "admin_password" {
#  type      = string
#  sensitive = true
#}