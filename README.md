# Terraform Powered Multi-Cloud Architecture
## Key Objectives
In this architecture, three essential infrastructure components will be deployed on each cloud platform:

Virtual Machine Instance: A VM instance is created to provide computing resources on each platform, demonstrating Terraform’s ability to manage compute instances in AWS, Azure, and GCP.
Virtual Private Cloud (VPC): A network is established on each cloud platform to ensure secure and isolated environments for resources, allowing cross-platform communication within the private network.
Database Instance: A managed database service will be provisioned on each platform, providing a consistent data layer across the cloud environments.
# Deployment
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
```

### Creating Resources on GCP

```
# This is the provider block of GCP, which will assign resources on GCP

provider "google" {
  project     = "compact-circlet-439814-n4"
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
```

### Creating Resources on Azure

