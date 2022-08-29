resource "azurerm_resource_group" "resource_group" {
  name     = var.rg-name
  location = var.location
}

resource "azurerm_storage_account" "static-web-demo-storage" {
  name                = var.storage-account-name
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  static_website {
    index_document = var.index_document
  }
}

#Add index.html to blob storage
resource "azurerm_storage_blob" "static-web-demo-storage-blob" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.static-web-demo-storage.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
}

# CDN Profile
resource "azurerm_cdn_profile" "static-web-demo-cdnprofile" {
  name                = var.cdnprofile-name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = var.cdnprofile-sku

  tags = {
    environment = "demo"
    cost_center = "demo-cost-center"
  }
}

# CDN Endpoint
resource "azurerm_cdn_endpoint" "static-web-endpoint" {
  name                = var.cdn-endpoint-name
  profile_name        = azurerm_cdn_profile.static-web-demo-cdnprofile.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  origin_host_header  = azurerm_storage_account.static-web-demo-storage.primary_web_host

  origin {
    name      = "staticwebdemoportal"
    host_name = azurerm_storage_account.static-web-demo-storage.primary_web_host
  }

  # Rules for Rules Engine
  delivery_rule {
    name  = "spaURLReroute"
    order = "1"

    url_file_extension_condition {
      operator     = "LessThan"
      match_values = ["1"]
    }

    url_rewrite_action {
      destination             = "/index.html"
      preserve_unmatched_path = "false"
      source_pattern          = "/"
    }
  }

  delivery_rule {
    name  = "EnforceHTTPS"
    order = "2"

    request_scheme_condition {
      operator     = "Equal"
      match_values = ["HTTP"]
    }

    url_redirect_action {
      redirect_type = "Found"
      protocol      = "Https"
    }
  }
}