terraform {
  backend "gcs" {
    bucket = "mcg-ope-admin-gha-tfstate"
    prefix = "mec001-datateam2-my_project_gcp/__env__"
  }

  required_providers {
    google = ">= 4.0.0"
  }
}

provider "google" {
  region       = var.region
}
