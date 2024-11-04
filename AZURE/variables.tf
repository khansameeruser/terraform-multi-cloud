# Define variables for commonly used values

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "resourceaz"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "Central India"
}

# Virtual Network configuration
variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
  default     = "vnetaz"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Subnet configuration
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnetaz"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

# VM Configuration
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vmaz"
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "useraz"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "C:/Users/khans/.ssh/id_rsa.pub"
}

# Storage Account configuration
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "storageaccaz"
}

# CosmosDB configuration
variable "cosmosdb_account_name" {
  description = "Name of the CosmosDB account"
  type        = string
  default     = "cosmosdbaz"
}

variable "cosmosdb_database_name" {
  description = "Name of the SQL database in CosmosDB"
  type        = string
  default     = "sqldbaz"
}

variable "cosmosdb_container_name" {
  description = "Name of the CosmosDB SQL container"
  type        = string
  default     = "sqlaz"
}

variable "cosmosdb_throughput" {
  description = "Throughput for CosmosDB database"
  type        = number
  default     = 400
}
