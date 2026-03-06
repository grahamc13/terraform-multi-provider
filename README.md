# terraform-multi-provider

Terraform infrastructure-as-code supporting deployments across multiple hypervisors and cloud providers.

## Supported Providers

| Provider       | Type        | Module path              |
|----------------|-------------|--------------------------|
| AWS            | Cloud       | `modules/aws`            |
| Azure          | Cloud       | `modules/azure`          |
| Google Cloud   | Cloud       | `modules/gcp`            |
| Proxmox        | On-premises | `modules/proxmox`        |
| VMware ESXi    | On-premises | `modules/vmware-esxi`    |
| Hyper-V        | On-premises | `modules/hyperv`         |

## Repository Structure

```
.
├── modules/                  # Reusable provider modules
│   ├── aws/
│   ├── azure/
│   ├── gcp/
│   ├── proxmox/
│   ├── vmware-esxi/
│   └── hyperv/
├── environments/             # Per-environment root configs
│   ├── dev/
│   ├── staging/
│   └── prod/
├── .github/workflows/        # CI/CD pipelines
├── versions.tf               # Provider version constraints
└── variables.tf              # Shared variable definitions
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.6.0
- Credentials configured for whichever providers you are targeting (see below)

## Usage

### 1. Configure credentials

Copy the example vars file for your target environment and fill in values:

```bash
cp environments/dev/terraform.example.tfvars environments/dev/terraform.tfvars
```

Set any required environment variables for your providers:

```bash
# AWS
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."

# Azure
export ARM_CLIENT_ID="..."
export ARM_CLIENT_SECRET="..."
export ARM_SUBSCRIPTION_ID="..."
export ARM_TENANT_ID="..."

# GCP
export GOOGLE_CREDENTIALS="$(cat path/to/service-account.json)"

# Proxmox
export PM_API_TOKEN_ID="..."
export PM_API_TOKEN_SECRET="..."

# VMware
export VSPHERE_USER="..."
export VSPHERE_PASSWORD="..."

# Hyper-V
export TF_VAR_hyperv_host="..."
```

### 2. Deploy an environment

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

## Enabling / Disabling Providers

Each provider is gated by a boolean variable in `terraform.tfvars`:

```hcl
aws_enabled     = true
azure_enabled   = false
gcp_enabled     = false
proxmox_enabled = true
vsphere_enabled = false
hyperv_enabled  = false
```

## CI/CD

GitHub Actions workflows in `.github/workflows/terraform.yml` run `terraform fmt`, `validate`, and `plan` on every pull request, and `apply` on merge to `main`.
