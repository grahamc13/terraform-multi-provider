variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Name of the project, used as a prefix for resource naming"
  type        = string
  default     = "myproject"
}

# ── AWS ────────────────────────────────────────────────────────────────────────
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_enabled" {
  description = "Deploy resources in AWS"
  type        = bool
  default     = false
}

# ── Azure ──────────────────────────────────────────────────────────────────────
variable "azure_location" {
  description = "Azure region/location"
  type        = string
  default     = "East US"
}

variable "azure_enabled" {
  description = "Deploy resources in Azure"
  type        = bool
  default     = false
}

# ── GCP ────────────────────────────────────────────────────────────────────────
variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "gcp_enabled" {
  description = "Deploy resources in GCP"
  type        = bool
  default     = false
}

# ── Proxmox ────────────────────────────────────────────────────────────────────
variable "proxmox_api_url" {
  description = "Proxmox API URL (e.g. https://proxmox.example.com:8006/api2/json)"
  type        = string
  default     = ""
}

variable "proxmox_enabled" {
  description = "Deploy resources on Proxmox"
  type        = bool
  default     = false
}

# ── VMware ESXi / vSphere ──────────────────────────────────────────────────────
variable "vsphere_server" {
  description = "vCenter or ESXi hostname/IP"
  type        = string
  default     = ""
}

variable "vsphere_enabled" {
  description = "Deploy resources on VMware ESXi/vSphere"
  type        = bool
  default     = false
}

# ── Hyper-V ────────────────────────────────────────────────────────────────────
variable "hyperv_host" {
  description = "Hyper-V host hostname/IP"
  type        = string
  default     = ""
}

variable "hyperv_enabled" {
  description = "Deploy resources on Hyper-V"
  type        = bool
  default     = false
}
