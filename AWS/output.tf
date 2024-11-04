# Output for the AWS EC2 Instance Public IP
output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance."
  value       = aws_instance.vmaws.public_ip
}

# Output for the VPC ID
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.vpcaws.id
}

# Output for the Subnet ID
output "subnet_id" {
  description = "The ID of the created Subnet."
  value       = aws_subnet.subnetaws.id
}

# Output for the S3 Bucket Name
output "s3_bucket_name" {
  description = "The name of the created S3 bucket."
  value       = aws_s3_bucket.s3bucketaws.bucket
}

# Output for the DynamoDB Table Name
output "dynamodb_table_name" {
  description = "The name of the created DynamoDB table."
  value       = aws_dynamodb_table.tableaws.name
}

# Output for the DynamoDB Table Item (User)
output "dynamodb_table_item" {
  description = "The details of the item added to the DynamoDB table."
  value       = aws_dynamodb_table_item.user.item
}
