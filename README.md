# Terraform Powered Multi-Cloud Architecture
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
     
