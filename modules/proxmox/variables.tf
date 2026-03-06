variable "enabled" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "api_url" {
  description = "Proxmox API URL, e.g. https://proxmox.example.com:8006/api2/json"
  type        = string
  default     = ""
}

variable "tls_insecure" {
  description = "Skip TLS verification (set to false in production)"
  type        = bool
  default     = true
}

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    target_node    = string
    template       = string
    cores          = number
    memory         = number
    disk_size      = string
    storage        = string
    network_bridge = string
    ip_address     = string
    gateway        = string
  }))
  default = {}
}
