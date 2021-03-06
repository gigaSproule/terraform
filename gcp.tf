provider "google" {
  project = var.google_project
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "vm_instance" {
  name                      = "terraform-instance"
  machine_type              = "e2-micro"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_storage_bucket" "storage_bucket" {
  name                        = "benjaminsproule-terraform-storage"
  location                    = "US"
  uniform_bucket_level_access = true
  force_destroy               = true
}
