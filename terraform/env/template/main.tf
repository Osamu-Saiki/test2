data "terraform_remote_state" "common" {
  backend = "gcs"
  config = {
    bucket = "mcg-ope-admin-gha-tfstate"
    prefix = "mec555-datateam555-myproject555/common"
  }
}

module "main" {
  source = "../../modules"

  region = var.region
  prj_mcg_ope_admin = var.prj_mcg_ope_admin

  company = var.company
  dept = var.dept
  project = var.project
  env = var.env
  subnet_cidr = var.subnet_cidr
  email = var.email

  folder_id = data.terraform_remote_state.common.outputs.folder_id
}
