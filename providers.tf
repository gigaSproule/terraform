terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}
