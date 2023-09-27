terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.84.0"
    }
  }
}

provider "google" {
  project     = "terraform-gcp-provider"
  region      = var.region
  credentials = file("terraform-gcp-provider-64fbb35e93e3.json")
}