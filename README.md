# Terraform Powered Multi-Cloud Architecture
# Deployment
## Step 1: Setting up Terraform

You can refer to this guide for [Terraform Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

I am using VS Code with terraform official plugin for easy text editing, you can use any text editor

![Screenshot 2024-10-26 021416](https://github.com/user-attachments/assets/99b1b25e-43c2-4064-87c8-0bdd91111e27)

## Step 2: Initializing AWS, Azure, and GCP providers in Terraform

```hcl
# HCL
# Terraform AWS Setup

provider "aws" {
  region     = "ap-south-2"
  access_key = "MYACCESSKEY" (You have to enter your access key value from your AWS account here)
  secret_key = "MYSECRETKEY" (You have to enter your secret key value from your AWS account here)
}
