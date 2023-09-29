locals {
  service = toset([
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "monitoring.googleapis.com",
    "compute.googleapis.com",
    "cloudasset.googleapis.com",
    "iam.googleapis.com",
  ])
}

resource "google_project_service" "main" {
  project = split("/", google_project.main.id)[1]
  for_each = local.service
  service = each.value

  disable_on_destroy = true
}