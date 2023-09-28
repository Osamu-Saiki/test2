resource "google_folder" "env" {
  display_name = "${var.env}"
  parent = "${var.folder_id}"
}

resource "google_project" "main" {
  name = "${local.prefix}-${var.env}"
  project_id = "${local.prefix}-${var.env}"
  folder_id = google_folder.env.name
  billing_account = data.google_secret_manager_secret_version.billing_account_id.secret_data
  auto_create_network = false
}