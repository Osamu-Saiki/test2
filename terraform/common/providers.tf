terraform {
  backend "gcs" {
    bucket = "mcg-ope-admin-gha-tfstate"
    prefix = "mec555-datateam555-myproject555/common"
  }

  required_providers {
    google = ">= 4.0.0"
  }
}

provider "google" {
  region       = var.region
}
