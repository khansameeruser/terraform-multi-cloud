# Challenges Faced with Terraform Configuration

This document outlines challenges encountered while configuring infrastructure using Terraform and the solutions applied to resolve each issue.

---

## Challenge 1: No Changes Happening in AWS Infrastructure Even After Authentication

**Problem:**  

![No changes](https://github.com/user-attachments/assets/7e3f626c-bdb2-480e-a43f-2c9d1bd9172f)
After authenticating AWS CLI with Terraform, running `terraform plan` and `terraform apply` would make no changes to my AWS infrastructure

![AWS No Instance](https://github.com/user-attachments/assets/202b09b6-6f33-4469-8543-0a65492b72e5)
I have no instance in my AWS account, and the terraform code makes one instance, but instead it says no changes as my infrastructure matches my code


**Solution:** 

![terraform folder](https://github.com/user-attachments/assets/37c05ac1-49b9-4b29-b2a2-2ec9ae09e820)

I had to delete the .terraform folder for some misconfigurations regarding aws version that happened, it is better to avoid mentioning version in the terraform file because it automatically detects and install the latest version,

![version](https://github.com/user-attachments/assets/7354b838-0d29-4787-a293-d09cee293021)
This issue happened because of referring to online documentation on their website which mentions version which is outdated, so it’s better to not mention version as terraform will automatically detect and install the latest version by itself


**Result:** 

![new](https://github.com/user-attachments/assets/fe375fed-310e-4e5c-b10b-99df030b233b)
Running `terraform plan` now correctly shows the actions it will take on my AWS infrastructure.

---

## Challenge 2: Reference Error

**Problem:**  

![keep](https://github.com/user-attachments/assets/e9a8427b-30b5-4192-8087-05a7914cd839)
Reference error, it gave me a reference error which stated that my given references were wrong and not named or tagged properly in the code


**Solution:** 

![6](https://github.com/user-attachments/assets/dfc242ac-4e38-4603-966b-48e6a3682c6d)
I corrected my reference from the default name “main” to the name I had given which was “vpcaws” in the code

**Result:**  

![yhtyfdftg](https://github.com/user-attachments/assets/7965bdc6-961c-49f7-a14a-dcf7498bfcbd)
Code worked perfectly, sometimes these error occur due to bad referencing or overlooking of the code personal referencing naming criteria

---

## Challenge 3: Inappropriate Value for Attribute "Database"

**Problem:**  

![1](https://github.com/user-attachments/assets/1d386dba-40eb-4e62-b76e-ec329d4121ff)

The following error occurred:  

`Inappropriate value for attribute “database”: string required`.  
This meant that my Google Firestore database value needed to be in string format.

**Solution:**  

![2](https://github.com/user-attachments/assets/46b56b8b-8f98-4832-9d8c-fefb676d3f9f)

To resolve this, I converted `google_firestore_database.databasegcp` to `google_firestore_database.databasegcp.id`, making the value a string.

**Result:**  

![3](https://github.com/user-attachments/assets/6db6bdf5-3ef0-4ecb-893a-a4af2df5eb84) 

The error was resolved, and the code worked as expected.

---

## Challenge 4: SSH Keypair Not Created

**Problem:**  

![4](https://github.com/user-attachments/assets/679871bc-3169-4216-93a4-c4951371e608)

ssh keypair not created, so it called an empty path, therefore the error has occurred asking me to create the required resource which means ssh keypair

Azure code requires ssh keypair to be created in default system to be used to connect to virtual machine via ssh

**Solution:**  
I created an SSH keypair on my system using the following command:

```bash
ssh-keygen -t rsa -b 2048
```

**Result:** 

![5](https://github.com/user-attachments/assets/e369617a-b6f7-442d-911c-df79b383c47f)

my virtual machine will be created because it has verified the system for ssh keypairs which i just created
