# This is a Step by Step Deployment Guide

This file provides comprehensive steps for deploying the serverless web application on AWS. It ensures that users can successfully deploy the application in their AWS environment.

## Step 1: Setting up Terraform

You can refer to this guide for [Terraform Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

I am using VS Code with terraform official plugin for easy text editing, you can use any text editor

![Screenshot 2024-10-26 021416](https://github.com/user-attachments/assets/99b1b25e-43c2-4064-87c8-0bdd91111e27)

## Step 2: Initializing AWS in Terraform
### AWS Authentication for Resource Provisioning

AWS requires authentication, AWS CLI can be used to authenticate with AWS to be used in terraform.

1. **Install the AWS CLI**:
   - Follow the official AWS CLI installation guide [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

2. **Configure the AWS CLI**:
   - After installing the AWS CLI, run this command to configure your credentials:
     ```bash
     aws configure
     ```
   - Enter your AWS Access Key ID, AWS Secret Access Key, default region name, and output format.

   Example:
   ```plaintext
   AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID                  (Enter your AWS access key here)
   AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY          (Enter your AWS secret key here)
   Default region name [None]: ap-south-2
   Default output format [None]: json
### AWS Provider Configuration in Terraform

This is the provider block which configures the specified provider (AWS)
```hcl
# HCL
# Terraform AWS provider configuration

provider "aws" {
  region  = "ap-south-2"
}
```
### Run Terraform init
```
terraform init
```
![image](https://github.com/user-attachments/assets/43567479-287a-41ae-af50-69d13e0f238a)
terraform init confirms our provider and authentication with AWS

## Step 3: Initializing Azure in Terraform
### Azure Authentication for Resource Provisioning

Azure requires authentication, Azure CLI can be used to authenticate with Azure to be used in terraform.

1. **Install the Azure CLI**:
   - Follow the official Azure CLI installation guide [here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli#install).

2. **Configure the AWS CLI**:
   - After installing the Azure CLI, open run this command to configure your credentials:
     ```bash
     az login
     ```
3. **Login into your Azure Account**
   
   ![image](https://github.com/user-attachments/assets/f1f90f61-6bd4-4158-8c8e-096cfa266b48)
   - A Microsoft login prompt window will open, select your azure account with a running and active subscription, and it will automatically select your subscription and tenant id

### Azure Provider Configuration in Terraform

This is the provider block which configures the specified provider (Azure)
```hcl
# HCL
# Terraform Azure provider configuration

provider "azurerm" {
    features {}
}
```
### Run Terraform init
```
terraform init
```

![image](https://github.com/user-attachments/assets/15b8b350-bdaf-4bf6-82bc-1e9d150b6d2b)
terraform init confirms our provider and authentication with Azure

## Step 4: Initializing GCP in Terraform
### GCP Authentication for Resource Provisioning

GCP requires authentication, gcloud CLI can be used to authenticate with terraform.

1. **Install the gcloud CLI**:
   - Follow the official gcloud CLI installation guide [here](https://cloud.google.com/sdk/docs/install).

2. **Configure the gcloud CLI**:
   - After installing the Azure CLI, open run this command to configure your credentials:
     ```bash
     gcloud auth application-default login
     ```
3. **Login through web when prompted**
   - The command will open web browser login page with cli gcloud authentication, use your account to log in
     ![gcloud CLI successfull authentication](https://github.com/user-attachments/assets/88a2aef2-66b5-421a-bcb8-4a64380f3b60)
     I have successfully authenticated

### GCP Provider Configuration in Terraform

This is the provider block which configures the specified provider (GCP)
```hcl
# HCL
# Terraform GCP provider configuration

provider "google" {
  project     = "my-project-id"         (Enter your project ID here)
  region      = "asia-south2"
}
```
### Run Terraform init
```
terraform init
```
![terraform init gcp](https://github.com/user-attachments/assets/d8dd904f-8fb3-40f1-88b7-42a3de7bbabc)
terraform init confirms our provider and authentication with GCP

## Step 5: Creating resources on Cloud Platforms
### Creating Resources on AWS

```
# This is the provider block of AWS, which will assign resources on AWS

provider "aws" {
  region  = "ap-south-2"
}

# Creating an VM in AWS

resource "aws_instance" "vmaws" {
  ami           = "ami-0867df9d01e38f97d"     # You can choose your AMI id from AWS EC2 console
  instance_type = "t3.micro"
}

# Creating a VPC in AWS (with 1 subnet)

resource "aws_vpc" "vpcaws" {
  cidr_block           = "10.0.0.0/16"    # This is CIDR block of VPC
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnetaws" {
  vpc_id                  = aws_vpc.vpcaws.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-2"
  map_public_ip_on_launch = true
}

# Creating a S3 bucket in AWS

resource "aws_s3_bucket" "s3bucketaws" {
  bucket = "s3bucketaws"
}

# Create a DynamoDB table with attributes (name, age and phone)

# DynamoDB Table
resource "aws_dynamodb_table" "tableaws" {
  name           = "tableaws"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserID"

  attribute {
    name = "UserID"
    type = "S"
  }
}

# Adding an item to the DynamoDB Table

resource "aws_dynamodb_table_item" "user" {
  table_name = aws_dynamodb_table.tableaws.name
  hash_key   = aws_dynamodb_table.tableaws.hash_key

  item = <<ITEM
    {
      "UserID": {"S": "123"},
      "name": {"S": "Alice"},
      "age": {"N": "30"},
      "phone_number": {"S": "1234567890"}
    }
  ITEM
}
```

### Creating Resources on GCP

```
# This is the provider block of GCP, which will assign resources on GCP

provider "google" {
  project     = "your_project_id"       # Enter your GCP project ID 
  region      = "asia-south2"
  zone        = "asia-south2-a"
}

# Creating a VM in GCP

resource "google_compute_instance" "vmgcp" {
  name         = "vmgcp"
  machine_type = "e2-micro"       # You can select your own machine type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"     # You can select your own machine image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# Creating a VPC in GCP (with 1 subnet)

resource "google_compute_network" "vpcgcp" {
  name = "terraform-network"
  auto_create_subnetworks = false       # It will disable automatic subnet creation
}

resource "google_compute_subnetwork" "subnetgcp" {
  name          = "terraform-subnet"
  ip_cidr_range = "10.0.1.0/24"         # This is the IP range for subnet
  region        = "asia-south2"
  network       = google_compute_network.vpcgcp.id
}

# Creating a storage bucket in GCP

resource "google_storage_bucket" "bucketgcp" {
  name     = "bucketgcp"
  location = "asia-south2"
}

# Create a Firestore table with attributes (name, age and phone) in GCP
 
resource "google_firestore_database" "databasegcp" {
  project     = "my-project-name"
  name        = "databasegcp"
  location_id = "asia-south2"
  type        = "FIRESTORE_NATIVE"
}

# Creating a document with fields in firestore database

resource "google_firestore_document" "docgcp" {
  database    = google_firestore_database.databasegcp.id
  collection  = "collectiongcp"
  document_id = "documentgcp"
  fields      = "{\"userID\":{\"name\":{\"age\":{\"phone_number\":{\"emailID\":\"location\"}}}}}"
}
```

### Creating Resources on Azure

```
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
```
