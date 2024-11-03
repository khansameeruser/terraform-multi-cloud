# Terraform Powered Multi-Cloud Architecture
## Key Objectives
In this architecture, three essential infrastructure components will be deployed on each cloud platform:

Virtual Machine Instance: A VM instance is created to provide computing resources on each platform, demonstrating Terraform’s ability to manage compute instances in AWS, Azure, and GCP.
Virtual Private Cloud (VPC): A network is established on each cloud platform to ensure secure and isolated environments for resources, allowing cross-platform communication within the private network.
Database Instance: A managed database service will be provisioned on each platform, providing a consistent data layer across the cloud environments.


# Terraform Powered Multi-Cloud Architecture Project

## Project Overview
This project is a Terraform-powered multi-cloud infrastructure setup, enabling consistent, automated deployments across three major cloud providers: AWS, Azure, and GCP. The project aims to demonstrate the flexibility of multi-cloud architecture and the ease of using Infrastructure as Code (IaC) to manage resources on multiple platforms from a single Terraform configuration. The infrastructure setup includes four core tasks on each provider, making it a versatile and portable solution for anyone looking to leverage the advantages of a multi-cloud environment.

Through this project, users can create and manage cloud resources, including virtual machines, virtual private clouds (VPCs), storage buckets, and database servers with basic attributes such as UserID, name, age, phone number, and emailID. Each component is defined and maintained in code, enabling reproducibility, scalability, and version control of infrastructure deployments. This project not only highlights the use of Terraform as an IaC tool but also exemplifies best practices in resource management and automation in a multi-cloud setup.

## Tech Stack
- **Terraform**: Primary Infrastructure as Code tool used for managing resources across AWS, Azure, and GCP.
- **AWS**: For provisioning virtual machines, VPCs, S3 storage buckets, and DynamoDB databases.
- **Azure**: For creating virtual machines, virtual networks (VPCs), blob storage containers, and Cosmos DB databases.
- **Google Cloud Platform (GCP)**: For deploying virtual machines, VPCs, Google Cloud Storage buckets, and Firestore databases.

---
## Scope of Project
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

## Tasks Overview
1. **Create a Virtual Machine**: Deploy a virtual machine instance on each cloud provider.
2. **Create a VPC**: Set up a Virtual Private Cloud to enable secure network management.
3. **Create a Storage Bucket**: Provision storage resources for data storage and management.
4. **Create a Database Server**: Set up a database instance in each provider with user-defined attributes (UserID, name, age, phone number, emailID).

This project is ideal for individuals and organizations looking to build a foundational, cross-platform infrastructure with ease of management, scalability, and automation.

## Getting Started
### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- AWS, Azure, and GCP accounts with necessary permissions
- Configured provider authentication (AWS CLI, Azure CLI, and GCP SDK)

### Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/multi-cloud-architecture.git
   cd multi-cloud-architecture
