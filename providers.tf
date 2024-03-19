provider "google" {
  project = "student-00451"
  region  = "us-central1"
  zone    = "us-central1-a"
}

terraform {
  backend "gcs" {
    bucket = "gh-terra-u6-0319"
    prefix = "terraform/state"
  }
} 
