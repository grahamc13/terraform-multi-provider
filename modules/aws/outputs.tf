output "vpc_id" {
  description = "The ID of the VPC"
  value       = var.enabled ? aws_vpc.main[0].id : null
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = var.enabled ? aws_subnet.public[*].id : []
}
