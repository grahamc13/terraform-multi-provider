output "vm_ids" {
  description = "Map of VM names to their Proxmox IDs"
  value       = var.enabled ? { for k, v in proxmox_vm_qemu.vm : k => v.id } : {}
}

output "vm_ip_addresses" {
  description = "Map of VM names to their IP addresses"
  value       = var.enabled ? { for k, v in proxmox_vm_qemu.vm : k => v.default_ipv4_address } : {}
}
