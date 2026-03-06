provider "proxmox" {
  pm_api_url      = var.api_url
  pm_tls_insecure = var.tls_insecure
  # Credentials via environment variables:
  # PM_API_TOKEN_ID and PM_API_TOKEN_SECRET
}

resource "proxmox_vm_qemu" "vm" {
  for_each = var.enabled ? var.vms : {}

  name        = each.key
  target_node = each.value.target_node
  clone       = each.value.template
  full_clone  = true

  cores   = each.value.cores
  memory  = each.value.memory
  scsihw  = "virtio-scsi-pci"
  os_type = "cloud-init"

  disk {
    slot    = 0
    size    = each.value.disk_size
    type    = "scsi"
    storage = each.value.storage
  }

  network {
    model  = "virtio"
    bridge = each.value.network_bridge
  }

  ipconfig0 = "ip=${each.value.ip_address},gw=${each.value.gateway}"

  tags = "${var.environment},terraform"
}
