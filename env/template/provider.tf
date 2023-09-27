locals {
  github_repository         = "G-gen-Co-Ltd/teachme_test3"
  project_id                = "saikio"
  region                    = "asia-northeast2"
  terraform_service_account = "terraform@saikio.iam.gserviceaccount.com"

  # api 有効化用
  services = toset([                       # Workload Identity 連携用
    "iam.googleapis.com",                  # IAM
    "cloudresourcemanager.googleapis.com", # Resource Manager
    "iamcredentials.googleapis.com",       # Service Account Credentials
    "sts.googleapis.com"                   # Security Token Service API
  ])
}

# provider 設定
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
  required_version = ">= 1.3.0"
  backend "gcs" {
    bucket = "csv_send_bucket"
    prefix = "terraform/state"
  }
}
