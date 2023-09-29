variable "region" {
  type = string
}
variable "prj_mcg_ope_admin" {
  type = string
}

variable "company" {
  type = string
}
variable "dept" {
  type = string
}
variable "project" {
  type = string
}
locals {
  prefix = "${var.company}-${var.dept}-${var.project}"
}
variable "env" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "email" {
  type = string
}

variable "folder_id" {
  type = string
}