# This is the provider block of GCP, which will assign resources on GCP

provider "google" {
  project     = "your_project_id"       # Enter your GCP project ID 
  region      = "asia-south2"
  zone        = "asia-south2-a"
}

# Creating a VM in GCP

resource "google_compute_instance" "vmgcp" {
  name         = "vmgcp"
  machine_type = "e2-micro"       # You can select your own machine type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"     # You can select your own machine image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# Creating a VPC in GCP (with 1 subnet)

resource "google_compute_network" "vpcgcp" {
  name = "terraform-network"
  auto_create_subnetworks = false       # It will disable automatic subnet creation
}

resource "google_compute_subnetwork" "subnetgcp" {
  name          = "terraform-subnet"
  ip_cidr_range = "10.0.1.0/24"         # This is the IP range for subnet
  region        = "asia-south2"
  network       = google_compute_network.vpcgcp.id
}

# Creating a storage bucket in GCP

resource "google_storage_bucket" "bucketgcp" {
  name     = "bucketgcp"
  location = "asia-south2"
}

# Create a Firestore table with attributes (name, age and phone) in GCP
 
resource "google_firestore_database" "databasegcp" {
  project     = "my-project-name"
  name        = "databasegcp"
  location_id = "asia-south2"
  type        = "FIRESTORE_NATIVE"
}

# Creating a document with fields in firestore database

resource "google_firestore_document" "docgcp" {
  database    = google_firestore_database.databasegcp.id
  collection  = "collectiongcp"
  document_id = "documentgcp"
  fields      = "{\"userID\":{\"name\":{\"age\":{\"phone_number\":{\"emailID\":\"location\"}}}}}"
}
