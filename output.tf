output "resource_group_name" {
  value       = azurerm_resource_group.resource_group.name
  description = "Name of the resource group"
}

output "name" {
  value       = azurerm_storage_account.static-web-demo-storage.primary_web_host
  description = "Location/Endpoint of the storage blob"
}

output "static_website_url" {
  value       = azurerm_cdn_endpoint.static-web-endpoint.origin
  description = "CDN Endpoint Url"
}