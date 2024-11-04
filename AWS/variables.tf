# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap-south-2"
}

# EC2 Instance
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0867df9d01e38f97d"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

# VPC and Subnet
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# S3 Bucket
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "s3bucketaws"
}

# DynamoDB Table
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "tableaws"
}

variable "dynamodb_user_item" {
  description = "User item attributes for the DynamoDB table"
  type = map(any)
  default = {
    UserID      = "123"
    name        = "Alice"
    age         = 30
    phone_number = "1234567890"
  }
}
