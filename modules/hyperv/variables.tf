variable "enabled" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "hyperv_host" {
  description = "Hyper-V host hostname or IP"
  type        = string
  default     = ""
}

variable "hyperv_port" {
  description = "WinRM port on the Hyper-V host"
  type        = number
  default     = 5986
}

variable "hyperv_user" {
  description = "Username for WinRM connection"
  type        = string
  default     = ""
}

variable "hyperv_password" {
  description = "Password for WinRM connection (use env var or secrets manager)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "tls_insecure" {
  description = "Skip TLS verification (set to false in production)"
  type        = bool
  default     = true
}

variable "vhd_path" {
  description = "Path on the Hyper-V host to store VHD files"
  type        = string
  default     = "C:\\Hyper-V\\Virtual Hard Disks"
}

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    num_cpus      = number
    memory_bytes  = number
    disk_size_bytes = number
    switch_name   = string
    iso_path      = string
  }))
  default = {}
}
