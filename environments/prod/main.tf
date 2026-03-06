locals {
  environment  = "prod"
  project_name = var.project_name
}

module "aws" {
  source = "../../modules/aws"

  enabled      = var.aws_enabled
  environment  = local.environment
  project_name = local.project_name
  aws_region   = var.aws_region
}

module "azure" {
  source = "../../modules/azure"

  enabled      = var.azure_enabled
  environment  = local.environment
  project_name = local.project_name
  location     = var.azure_location
}

module "gcp" {
  source = "../../modules/gcp"

  enabled      = var.gcp_enabled
  environment  = local.environment
  project_name = local.project_name
  project_id   = var.gcp_project_id
  region       = var.gcp_region
}

module "proxmox" {
  source = "../../modules/proxmox"

  enabled     = var.proxmox_enabled
  environment = local.environment
  api_url     = var.proxmox_api_url
}

module "vmware" {
  source = "../../modules/vmware-esxi"

  enabled        = var.vsphere_enabled
  environment    = local.environment
  vsphere_server = var.vsphere_server
}

module "hyperv" {
  source = "../../modules/hyperv"

  enabled     = var.hyperv_enabled
  environment = local.environment
  hyperv_host = var.hyperv_host
}
