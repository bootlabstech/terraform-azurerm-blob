resource "azurerm_storage_account" "example" {
  name                     = var.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_account_replication_type
  account_kind = "BlobStorage"
  public_network_access_enabled = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  blob_properties {
    versioning_enabled = true
    
  }
  
}


resource "azurerm_storage_container" "example" {
  name                  = var.sa_container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.blob_type
#   source                 = "some-local-file.zip"
}