output "id" {
  value       = azurerm_resource_group.main.id
  description = "The resource group id"
}

output "name" {
  value       = var.name
  description = "The name of the resource group"
}

output "location" {
  value       = var.location
  description = "The location where the resource group was created."
}