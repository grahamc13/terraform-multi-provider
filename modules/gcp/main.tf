provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "main" {
  count                   = var.enabled ? 1 : 0
  name                    = "${var.project_name}-${var.environment}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  count         = var.enabled ? 1 : 0
  name          = "${var.project_name}-${var.environment}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.main[0].id
}
