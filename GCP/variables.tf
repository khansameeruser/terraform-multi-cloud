# Define the GCP provider configuration variables
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-south2"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "asia-south2-a"
}

# Virtual Machine Configuration
variable "vm_name" {
  description = "Name of the GCP VM instance"
  type        = string
  default     = "vmgcp"
}

variable "vm_machine_type" {
  description = "Machine type for the GCP VM instance"
  type        = string
  default     = "e2-micro"
}

variable "vm_image" {
  description = "Image used for the VM's boot disk"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

# Network Configuration
variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "terraform-network"
}

variable "subnet_name" {
  description = "Name of the subnet within the VPC"
  type        = string
  default     = "terraform-subnet"
}

variable "subnet_ip_range" {
  description = "IP range for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Storage Bucket Configuration
variable "bucket_name" {
  description = "Name of the GCP storage bucket"
  type        = string
  default     = "bucketgcp"
}

# Firestore Database Configuration
variable "database_name" {
  description = "Name of the Firestore database"
  type        = string
  default     = "databasegcp"
}

variable "collection_name" {
  description = "Name of the Firestore collection"
  type        = string
  default     = "collectiongcp"
}

variable "document_id" {
  description = "ID of the Firestore document"
  type        = string
  default     = "documentgcp"
}

variable "document_fields" {
  description = "Fields in the Firestore document (in JSON format)"
  type        = string
  default     = "{\"userID\":{\"name\":{\"age\":{\"phone_number\":{\"emailID\":\"location\"}}}}}"
}
