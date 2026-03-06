project_name = "myproject"

# ── Enable the providers you need ─────────────────────────────────────────────
aws_enabled     = false
azure_enabled   = false
gcp_enabled     = false
proxmox_enabled = false
vsphere_enabled = false
hyperv_enabled  = false

# ── AWS ────────────────────────────────────────────────────────────────────────
aws_region = "us-east-1"

# ── Azure ──────────────────────────────────────────────────────────────────────
azure_location = "East US"

# ── GCP ────────────────────────────────────────────────────────────────────────
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"

# ── Proxmox ────────────────────────────────────────────────────────────────────
proxmox_api_url = "https://proxmox.example.com:8006/api2/json"

# ── VMware ESXi / vSphere ──────────────────────────────────────────────────────
vsphere_server = "vcenter.example.com"

# ── Hyper-V ────────────────────────────────────────────────────────────────────
hyperv_host = "hyperv.example.com"
