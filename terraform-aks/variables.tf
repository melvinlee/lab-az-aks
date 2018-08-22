##################################################################################
# VARIABLES
##################################################################################

variable "client_id" {
  type        = "string"
  description = "Client ID"
}

variable "client_secret" {
  type        = "string"
  description = "Client secret."
}

variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "aks-rg"
}

variable "resource_group_location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "southeastasia"
}

variable "aks_name" {
  type        = "string"
  description = "Name of aks cluster."
  default     = "aks"
}

variable "acr_name" {
  type        = "string"
  description = "Name of azure container registry."
  default     = "melvinhub"
}

variable "environment" {
  type        = "string"
  description = "dev, test or production."
  default     = "dev"
}

variable "linux_admin_username" {
  type        = "string"
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
  default     = "azureuser"
}