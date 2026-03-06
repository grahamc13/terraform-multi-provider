provider "hyperv" {
  host     = var.hyperv_host
  port     = var.hyperv_port
  user     = var.hyperv_user
  password = var.hyperv_password
  https    = true
  insecure = var.tls_insecure
}

resource "hyperv_vhd" "disk" {
  for_each = var.enabled ? var.vms : {}

  path = "${var.vhd_path}\\${each.key}.vhdx"
  size = each.value.disk_size_bytes
}

resource "hyperv_machine_instance" "vm" {
  for_each   = var.enabled ? var.vms : {}
  depends_on = [hyperv_vhd.disk]

  name                   = each.key
  generation             = 2
  processor_count        = each.value.num_cpus
  static_memory          = true
  memory_startup_bytes   = each.value.memory_bytes
  wait_for_state_timeout = 10
  wait_for_ips_timeout   = 15

  network_adaptors {
    name        = "LAN"
    switch_name = each.value.switch_name
  }

  hard_disk_drives {
    controller_type     = "Scsi"
    controller_number   = 0
    controller_location = 0
    path                = hyperv_vhd.disk[each.key].path
  }

  dvd_drives {
    controller_number   = 0
    controller_location = 1
    path                = each.value.iso_path
  }
}
