output "vm_ids" {
  description = "Map of VM names to their vSphere IDs"
  value       = var.enabled ? { for k, v in vsphere_virtual_machine.vm : k => v.id } : {}
}

output "vm_ip_addresses" {
  description = "Map of VM names to their IP addresses"
  value       = var.enabled ? { for k, v in vsphere_virtual_machine.vm : k => v.default_ip_address } : {}
}
