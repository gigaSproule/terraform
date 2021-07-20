provider "google" {
  project = var.google_project
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

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

provider "aws" {
  region     = "eu-west-2"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "aws_vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}
