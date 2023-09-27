resource "google_service_account" "service_account" {
  account_id   = "service-account-id"
  display_name = "Service Account"
  #email = "terraform@saikio.iam.gserviceaccount.com"
}

#resource "google_project_iam_member" "sample_app_user_1" {
#  project = var.project_name.tf-sample
#  role   = "roles/storage.admin"
#  member = "serviceAccount:${google_service_account.service_account.email}"
#}

#resource "google_project_iam_member" "sample_app_user_2" {
#  project = var.project_name.tf-sample
#  role   = "roles/bigquery.admin"
#  member = "serviceAccount:${google_service_account.service_account.email}"
#}

resource "google_project_iam_member" "sample_app_user" {
  project = var.project_name.tf-sample
  count = "${length(var.sample_app_roles)}"
  role   = "${element(var.sample_app_roles, count.index)}"
  member = "serviceAccount:terraform@saikio.iam.gserviceaccount.com"
}

variable "sample_app_roles" {

 default=[
    "roles/storage.admin",
    "roles/bigquery.admin",
    "roles/run.admin",
    "roles/serviceusage.serviceUsageViewer",
    "roles/iam.roleAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.workloadIdentityPoolAdmin"
 ]
}