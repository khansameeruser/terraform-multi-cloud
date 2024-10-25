# Terraform Powered Multi-Cloud Architecture
# Deployment
## Step 1
I am using VS Code with terraform official plugin for easy text editing, you can use any text editor


```hcl
# Terraform AWS Setup

provider "aws" {
  region     = "ap-south-2"
  access_key = "MYACCESSKEY" (You have to enter your access key value from your AWS account here)
  secret_key = "MYSECRETKEY" (You have to enter your secret key value from your AWS account here)
}
