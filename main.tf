data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
data "azurerm_storage_container" "example" {
  name                 = var.container_name
  storage_account_name = data.azurerm_storage_account.example.name
}
resource "azurerm_storage_blob" "example" {
  count                  = var.no_of_blob
  name                   = var.name_of_blobs[count.index]
  storage_account_name   = data.azurerm_storage_account.example.name
  storage_container_name = data.azurerm_storage_container.example.name
  type                   = var.type
  size                   = var.size
  access_tier            = var.access_tier
  parallelism            = var.parallelism

}