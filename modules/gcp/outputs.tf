output "network_id" {
  value = var.enabled ? google_compute_network.main[0].id : null
}

output "subnet_id" {
  value = var.enabled ? google_compute_subnetwork.main[0].id : null
}
