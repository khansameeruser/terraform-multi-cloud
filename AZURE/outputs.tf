# Output the resource group name
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.resourceaz.name
}

# Output the VNet ID
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnetaz.id
}

# Output the Subnet ID
output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnetaz.id
}

# Output the Network Interface ID
output "network_interface_id" {
  description = "The ID of the network interface attached to the VM"
  value       = azurerm_network_interface.nicaz.id
}

# Output the Virtual Machine ID
output "vm_id" {
  description = "The ID of the Linux VM"
  value       = azurerm_linux_virtual_machine.vmaz.id
}

# Output the Storage Account name
output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storageaccaz.name
}

# Output the CosmosDB Account name
output "cosmosdb_account_name" {
  description = "The name of the CosmosDB Account"
  value       = azurerm_cosmosdb_account.cosmosdbaz.name
}

# Output the CosmosDB SQL Database name
output "cosmosdb_sql_database_name" {
  description = "The name of the CosmosDB SQL Database"
  value       = azurerm_cosmosdb_sql_database.sqldbaz.name
}

# Output the CosmosDB SQL Container name
output "cosmosdb_sql_container_name" {
  description = "The name of the CosmosDB SQL Container"
  value       = azurerm_cosmosdb_sql_container.sqlaz.name
}
