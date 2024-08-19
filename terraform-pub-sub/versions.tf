terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.31, < 6" # Adjust the version as needed
    }
  }
  required_version = ">= 0.14"


  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-pubsub/v6.0.0"
  }
}
