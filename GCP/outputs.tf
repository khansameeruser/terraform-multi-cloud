# Output the VM instance ID
output "vm_instance_id" {
  description = "The ID of the VM instance"
  value       = google_compute_instance.vmgcp.id
}

# Output the VPC Network ID
output "vpc_network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpcgcp.id
}

# Output the Subnet ID
output "subnet_id" {
  description = "The ID of the subnet within the VPC"
  value       = google_compute_subnetwork.subnetgcp.id
}

# Output the Storage Bucket name
output "storage_bucket_name" {
  description = "The name of the storage bucket"
  value       = google_storage_bucket.bucketgcp.name
}

# Output the Firestore Database name
output "firestore_database_name" {
  description = "The name of the Firestore database"
  value       = google_firestore_database.databasegcp.name
}

# Output the Firestore Document ID
output "firestore_document_id" {
  description = "The ID of the Firestore document"
  value       = google_firestore_document.docgcp.id
}
