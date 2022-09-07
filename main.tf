resource "azurerm_resource_group" "resource_group" {
  name     = var.rg-name
  location = var.location
}
# resource "azurerm_management_lock" "rg" {
#   name       = var.rg-name
#   scope      = azurerm_resource_group.resource_group.id
#   lock_level = var.lock_level
# }

resource "azurerm_storage_account" "static-web-storage" {
  name                     = var.storage-account-name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  static_website {
    index_document     = var.index_document
    error_404_document = var.error_404_document
  }
}

#Add index.html to blob storage
resource "azurerm_storage_blob" "static-web-storage-blob" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.static-web-storage.name
  storage_container_name = var.storage_container_name
  type                   = var.storage_type
  content_type           = var.storage_content_type
  source                 = var.source_content
}

#Add error.html to blob storage
resource "azurerm_storage_blob" "static-web-error-blob" {
  name                   = var.error_404_document
  storage_account_name   = azurerm_storage_account.static-web-storage.name
  storage_container_name = var.storage_container_name
  type                   = var.storage_type
  content_type           = var.storage_content_type
  source_content         = var.error_source

}

# CDN Profile
resource "azurerm_cdn_profile" "static-web-cdnprofile" {
  name                = var.cdnprofile-name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = var.cdnprofile-sku

  tags = {
    environment = var.environment
    cost_center = var.cost_center
  }
}

# CDN Endpoint
resource "azurerm_cdn_endpoint" "static-web-endpoint" {
  name                = var.cdn-endpoint-name
  profile_name        = azurerm_cdn_profile.static-web-cdnprofile.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  origin_host_header  = azurerm_storage_account.static-web-storage.primary_web_host

  origin {
    name      = var.rg-name
    host_name = azurerm_storage_account.static-web-storage.primary_web_host
  }
}
