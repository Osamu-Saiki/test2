variable "project_name" {
  default = {
    tf-sample = "saikio"
  }
}

# サービスアカウント
variable "credential" {
  default = {
    data = "credential.json"
  }
}

variable "bucket_name" {
  default = {
    bucket_name = "csv_send_bucket"
  }
}

variable "project_number" {
  default = {
    project_number = "204544863523"
  }
}

