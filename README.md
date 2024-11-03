# Terraform Powered Multi-Cloud Architecture
## Introduction

This project is a Terraform-powered multi-cloud infrastructure setup, enabling consistent, automated deployments across three major cloud providers: AWS, Azure, and GCP. The project aims to demonstrate the flexibility of multi-cloud architecture and the ease of using Infrastructure as Code (IaC) to manage resources on multiple platforms from a single Terraform configuration. The infrastructure setup includes four core tasks on each provider, making it a versatile and portable solution for anyone looking to leverage the advantages of a multi-cloud environment.

Through this project, users can create and manage cloud resources, including virtual machines, virtual private clouds (VPCs), storage buckets, and database servers with basic attributes such as UserID, name, age, phone number, and emailID. Each component is defined and maintained in code, enabling reproducibility, scalability, and version control of infrastructure deployments.

# Architecture
![terraform architecture](https://github.com/user-attachments/assets/eb3117b9-df1a-41b1-b3a8-6b0401543a12)
# Scope of Project :
## Resources Created on AWS, Azure and GCP using Terraform Infrastructure as Code (IaC)
### AWS
1. Created Ubuntu Virtual Machine (VM) in EC2
2. Created Virtual Private Cloud (VPC) with 1 subnet
3. Created a storage bucket in S3
4. Created a DynamoDB table with attributes (User ID, name, age and phone_number)
### GCP
1. Created Ubuntu Virtual Machine (VM) in Compute Engine
2. Created Virtual Private Cloud (VPC) with 1 subnet
3. Created a storage bucket in GCP
4. Created a Firestore table with attributes (UserID, name, age and phone_number)
### Azure
1. Created Virtual Network (VNet) with 1 subnet, and configured network interface with dynamic IP
2. Created Ubuntu Virtual Machine (VM), configured interface from VNet
3. Created a storage account with Blob Container
4. Created a CosmosDB SQL database table with attributes (UserID, name, age and phone_number)

# Tech Stack
- **Terraform**:
  
  Primary Infrastructure as Code tool used for managing resources across AWS, Azure, and GCP.
- **AWS Account**:
  
  For provisioning virtual machines, VPCs, S3 storage buckets, and DynamoDB databases.
- **Azure Account**:
  
  For creating virtual machines, virtual networks (VPCs), blob storage containers, and Cosmos DB databases.
- **gcloud Account**:
  
  For deploying virtual machines, VPCs, Google Cloud Storage buckets, and Firestore databases.
- **AWS CLI**:
  
  Required for Terraform authentication with AWS
- **Azure CLI**:
  
  Required for Terraform authentication with Azure
- **gcloud CLI**:
  
  Required for Terraform authentication with GCP
- **VS Code**:
  
  Used VS code text editor with offical terraform plugin for easy code management

# Deployment

## [View Deployment Guide](./DEPLOYMENT.md)
This file provides comprehensive steps for deploying the Terraform powered multi cloud architecture

# Challenges Faced

## [View Challenges Encountered](./CHALLENGES.md)
This document outlines challenges encountered while configuring infrastructure using Terraform and the solutions applied to resolve each issue.

# Usage
### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- AWS, Azure, and GCP accounts with necessary permissions
- Configured provider authentication (AWS CLI, Azure CLI, and GCP SDK)

#### 1. Clone the repository:
   ```bash
   git clone https://github.com/khansameeruser/terraform-multi-cloud.git
   cd terraform-multi-cloud
```

#### 2. Initialize Terraform: 
Navigate to each cloud provider’s folder (aws, azure, or gcp) and run:
```
terraform init
```

#### 3. Apply the Configuration:
In each folder, run:
```
terraform apply
```

#### 4. Verify Resources:
Check your cloud provider console to verify the created resources

#### 5. Destroy Resources (if needed):
You can clean up this setup by running:
```
terraform destroy
```
