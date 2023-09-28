resource "google_folder" "main" {
  display_name = "${var.company}-${var.dept}-${var.project}"
  parent = "folders/${data.google_secret_manager_secret_version.standard_folder_id.secret_data}"
}