output "vm_names" {
  description = "List of created VM names"
  value       = var.enabled ? [for k, v in hyperv_machine_instance.vm : v.name] : []
}
