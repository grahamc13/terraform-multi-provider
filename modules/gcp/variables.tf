variable "enabled" {
  type    = bool
  default = false
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = ""
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "subnet_cidr" {
  type    = string
  default = "10.2.1.0/24"
}
