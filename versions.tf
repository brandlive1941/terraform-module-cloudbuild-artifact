terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.81.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.81.0"
    }
  }
}