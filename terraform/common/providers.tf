terraform {
  backend "gcs" {
    bucket = "mcg-ope-admin-gha-tfstate"
    prefix = "mec001-datateam2-myproject/common"
  }

  required_providers {
    google = ">= 4.0.0"
  }
}

provider "google" {
  region       = var.region
}
