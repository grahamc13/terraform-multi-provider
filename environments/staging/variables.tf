# Re-declare root variables for this environment workspace
variable "project_name" {
  type    = string
  default = "myproject"
}

variable "aws_enabled"     { type = bool; default = false }
variable "aws_region"      { type = string; default = "us-east-1" }

variable "azure_enabled"   { type = bool; default = false }
variable "azure_location"  { type = string; default = "East US" }

variable "gcp_enabled"     { type = bool; default = false }
variable "gcp_project_id"  { type = string; default = "" }
variable "gcp_region"      { type = string; default = "us-central1" }

variable "proxmox_enabled" { type = bool; default = false }
variable "proxmox_api_url" { type = string; default = "" }

variable "vsphere_enabled" { type = bool; default = false }
variable "vsphere_server"  { type = string; default = "" }

variable "hyperv_enabled"  { type = bool; default = false }
variable "hyperv_host"     { type = string; default = "" }
