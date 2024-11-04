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
