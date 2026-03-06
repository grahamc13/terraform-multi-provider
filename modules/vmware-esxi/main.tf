provider "vsphere" {
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = var.allow_unverified_ssl
  # Credentials via environment variables:
  # VSPHERE_USER and VSPHERE_PASSWORD
}

data "vsphere_datacenter" "dc" {
  count = var.enabled ? 1 : 0
  name  = var.datacenter
}

data "vsphere_datastore" "datastore" {
  count         = var.enabled ? 1 : 0
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc[0].id
}

data "vsphere_network" "network" {
  count         = var.enabled ? 1 : 0
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc[0].id
}

data "vsphere_virtual_machine" "template" {
  count         = var.enabled ? 1 : 0
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.dc[0].id
}

resource "vsphere_virtual_machine" "vm" {
  for_each = var.enabled ? var.vms : {}

  name             = each.key
  resource_pool_id = each.value.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore[0].id

  num_cpus = each.value.num_cpus
  memory   = each.value.memory_mb

  network_interface {
    network_id   = data.vsphere_network.network[0].id
    adapter_type = data.vsphere_virtual_machine.template[0].network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = each.value.disk_size_gb
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template[0].id

    customize {
      linux_options {
        host_name = each.key
        domain    = var.domain
      }

      network_interface {
        ipv4_address = each.value.ip_address
        ipv4_netmask = each.value.netmask
      }

      ipv4_gateway = each.value.gateway
    }
  }

  tags = [var.environment, "terraform"]
}
