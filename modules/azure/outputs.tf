output "resource_group_name" {
  value = var.enabled ? azurerm_resource_group.main[0].name : null
}

output "vnet_id" {
  value = var.enabled ? azurerm_virtual_network.main[0].id : null
}

output "subnet_id" {
  value = var.enabled ? azurerm_subnet.main[0].id : null
}
