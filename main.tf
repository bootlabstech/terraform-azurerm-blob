resource "azurerm_storage_container" "example" {
  name                  = var.sa_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_storage_blob" "example" {
  name                   = var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.type
  size                   = var.size
  access_tier            = var.access_tier
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}