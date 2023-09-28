# Project
data "google_project" "mcg_ope_admin" {
  project_id = var.prj_mcg_ope_admin
}

# Secret Manager
data "google_secret_manager_secret_version" "billing_account_id" {
  project = data.google_project.mcg_ope_admin.number
  secret = "billing-account-id"
  version = 1
}