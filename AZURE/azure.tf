# This is the provider block for Azure

provider "azurerm" {
    features {}
    subscription_id = "your_subscription_id"     # Enter your Azure subscription ID
}

# Create a resource group

resource "azurerm_resource_group" "resourceaz" {
  name     = "resourceaz"
  location = "Central India"
}

# Create a VPC in Azure (Azure VPC is called VNet)

resource "azurerm_virtual_network" "vnetaz" {
  name                = "vnetaz"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resourceaz.location
  resource_group_name = azurerm_resource_group.resourceaz.name
}

# Create a Subnet in VNet

resource "azurerm_subnet" "subnetaz" {
  name                 = "subnetaz"
  resource_group_name  = azurerm_resource_group.resourceaz.name
  virtual_network_name = azurerm_virtual_network.vnetaz.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Creating a Network Interface for our VM

resource "azurerm_network_interface" "nicaz" {
  name                = "nicaz"
  location            = azurerm_resource_group.resourceaz.location
  resource_group_name = azurerm_resource_group.resourceaz.name

# Configuring IP configuration for that interface

  ip_configuration {
    name                          = "ipaz"
    subnet_id                     = azurerm_subnet.subnetaz.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a VM in Azure

resource "azurerm_linux_virtual_machine" "vmaz" {
  name                = "vmaz"
  resource_group_name = azurerm_resource_group.resourceaz.name
  location            = azurerm_resource_group.resourceaz.location
  size                = "Standard_B1s"
  admin_username      = "useraz"
  network_interface_ids = [
    azurerm_network_interface.nicaz.id,
  ]

  admin_ssh_key {
    username   = "useraz"
    public_key = file("C:/Users/khans/.ssh/id_rsa.pub")     # Your system ssh key location
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {         # This is the image reference format (fetched by AWS CLI)
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Creating a Blob Container in Azure

# First we have to create a storage account

resource "azurerm_storage_account" "storageaccaz" {
  name                     = "storageaccaz"
  resource_group_name      = azurerm_resource_group.resourceaz.name
  location                 = azurerm_resource_group.resourceaz.location
  account_tier             = "Standard"
  account_replication_type = "LRS"     # Locally redundant storage(LRS) means one zone availability
}

# Creating a Blob Container

resource "azurerm_storage_container" "containeraz" {
  name                  = "containeraz"
  storage_account_name  = azurerm_storage_account.storageaccaz.name
  container_access_type = "private"
}

# Creating a Database in Azure

# First we have to create a CosmosDB account

resource "azurerm_cosmosdb_account" "cosmosdbaz" {
  name                = "cosmosdbaz"
  location            = azurerm_resource_group.resourceaz.location
  resource_group_name = azurerm_resource_group.resourceaz.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  capabilities {
    name = "EnableMongo"   # This will enable us to use MongoDB API
  }
  
  consistency_policy {
    consistency_level       = "Session"    # Session policy is more cost effective
  }

  geo_location {
    location          = "centralindia"
    failover_priority = 0       # This is a region wise priority level if a failover were to occur 
  }
}

# Creating a SQL database in CosmosDb in Azure

resource "azurerm_cosmosdb_sql_database" "sqldbaz" {
  name                = "sqldbaz"
  resource_group_name = "resourceaz"   # We can directly write our resource name as well with ""
  account_name        = "cosmosdbaz"
  throughput          = 400
}

# Creating a SQL Container in CosmosDB (basically a table to strore data)

resource "azurerm_cosmosdb_sql_container" "sqlaz" {
  name                = "sqlaz"
  resource_group_name = "resourceaz"
  account_name        = "cosmosdbaz"
  database_name       = "sqldbaz"
  partition_key_paths  = ["/UserID"]

  # Define a few basic attributes
  unique_key {
    paths = ["/UserID"]    # Unique key to identify the data uniquely
  }
}

