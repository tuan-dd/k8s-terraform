terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.19.0" # Adjust the version as needed
    }
  }
  required_version = ">= 0.14"
}
