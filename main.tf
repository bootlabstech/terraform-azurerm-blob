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
  source_content         = var.source_content
}

#Add error.html to blob storage
resource "azurerm_storage_blob" "static-web-storage-blob" {
  name                   = var.error_404_document
  storage_account_name   = azurerm_storage_account.static-web-storage.name
  storage_container_name = var.storage_container_name
  type                   = var.storage_type
  content_type           = var.storage_content_type
  source         = var.error_source

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

# resource "azurerm_dns_zone" "static-web" {
#   name                = var.domain
#   resource_group_name = azurerm_resource_group.resource_group.name
# }

# resource "azurerm_dns_cname_record" "static-web" {
#   name                = var.cname
#   zone_name           = azurerm_dns_zone.static-web.name
#   resource_group_name = azurerm_dns_zone.static-web.resource_group_name
#   ttl                 = var.ttl
#   target_resource_id  = azurerm_cdn_endpoint.static-web-endpoint.id
# }
# resource "azurerm_cdn_endpoint_custom_domain" "static-web" {
#   name            = var.cname
#   cdn_endpoint_id = azurerm_cdn_endpoint.static-web-endpoint.id
#   host_name       = "${azurerm_dns_cname_record.static-web.name}.${azurerm_dns_zone.static-web.name}"
# }

#Cloudflare
module "modules" {
  source             = "bootlabstech/modules/cloudflare"
  version            = "1.0.1"
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_name    = var.cloudflare_name
  cloudflare_value   = azurerm_cdn_endpoint.static-web-endpoint.id
  cloudflare_type    = var.cloudflare_type
}