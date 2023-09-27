# workload_identity
locals {
  project_id = var.project_name.tf-sample
  region = "asia-northeast2"

  # terraform_sa = "<Actions実行時に借用したい権限を持つサービスアカウント>"
  terraform_sa = "saikio@saikio.iam.gserviceaccount.com"

  # repo_name    = "<GitHubユーザ名>/<GitHubリポジトリ名>"
  repo_name = "G-gen-Co-Ltd/teachme_test3"
}

resource "google_project_service" "project" {
  project = local.project_id
  service = "iamcredentials.googleapis.com"
}

resource "google_iam_workload_identity_pool" "github_actions_pool" {
  provider                  = google-beta
  project                   = local.project_id
  workload_identity_pool_id = "github-oidc-pool"
  display_name              = "github-oidc-pool"
  description               = "GitHub Actionsで使用"
}

resource "google_iam_workload_identity_pool_provider" "github_actions" {
  provider                           = google-beta
  project                            = var.project_name.tf-sample
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "github"
  description                        = "GitHub Actionsで使用"
  attribute_condition = "assertion.repository == '${local.repo_name}'"
  
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    
    
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Actionsで借用したい権限を持つサービスアカウント
data "google_service_account" "terraform_sa" {
  account_id = local.terraform_sa
}

# principalSetでどのリポジトリで利用するかを指定している
resource "google_service_account_iam_member" "terraform_sa_workload_identity_user" {
  service_account_id = data.google_service_account.terraform_sa.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions_pool.name}/attribute.repository/${local.repo_name}"
}
