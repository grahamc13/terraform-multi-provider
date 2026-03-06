variable "enabled" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "vsphere_server" {
  description = "vCenter or ESXi hostname/IP"
  type        = string
  default     = ""
}

variable "allow_unverified_ssl" {
  type    = bool
  default = false
}

variable "datacenter" {
  description = "vSphere datacenter name"
  type        = string
  default     = ""
}

variable "datastore" {
  description = "Datastore name for VM disks"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "VM network/portgroup name"
  type        = string
  default     = "VM Network"
}

variable "template_name" {
  description = "VM template to clone from"
  type        = string
  default     = ""
}

variable "domain" {
  description = "DNS domain for VM customization"
  type        = string
  default     = "local"
}

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    resource_pool_id = string
    num_cpus         = number
    memory_mb        = number
    disk_size_gb     = number
    ip_address       = string
    netmask          = number
    gateway          = string
  }))
  default = {}
}
