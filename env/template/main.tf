#module "gcs" {
  #source         = "../module/gcs"
  #project        = var.project_name.tf-sample
  #env            = var.env[terraform.workspace]
  #project_number = var.project_number.project_number
#}

module "bigquery" {
  source         = "../module/bigquery"
  #project        = var.project_name.tf-sample
  #env            = var.env[terraform.workspace]
  project_number = var.project_number.project_number
}

#module "cloud_run" {
  #source         = "../module/cloud_run"
  #project        = var.project_name.tf-sample
  #env            = var.env[terraform.workspace]
  #project_number = var.project_number.project_number
#}


#module "service_account" {
  #source         = "../module/service_account"
  #project        = var.project_name.tf-sample
  #env            = var.env[terraform.workspace]
  #project_number = var.project_number.project_number
#}

#module "workload_identity" {
  #source         = "../module/workload_identity"
  #project        = var.project_name.tf-sample
  #env            = var.env[terraform.workspace]
  #project_number = var.project_number.project_number
#}
