terraform {
  required_version = ">= 1.6.0"

  required_providers {
    # Cloud providers
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }

    # On-premises / hypervisor providers
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.6"
    }
    hyperv = {
      source  = "taliesins/hyperv"
      version = "~> 1.0"
    }
  }

  # Uncomment to use remote state (e.g. Terraform Cloud or S3)
  # backend "s3" {}
  # backend "azurerm" {}
  # backend "gcs" {}
}
