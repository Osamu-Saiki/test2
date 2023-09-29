# Project
data "google_project" "mcg_ope_admin" {
  project_id = var.prj_mcg_ope_admin
}

# Secret Manager
data "google_secret_manager_secret_version" "standard_folder_id" {
  project = data.google_project.mcg_ope_admin.number
  secret = "standard-folder-id"
  version = 1
}