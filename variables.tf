variable "location" {
  description = "The Azure Region in which all resources groups should be created."
}

variable "rg-name" {
  description = "The name of the resource group"
}

# variable "lock_level" {
#   description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created"
#   default     = "ReadOnly"
# }

variable "storage_container_name" {
  description = "The name of the storage container in which this blob should be created"
}
variable "storage_content_type" {
  description = "The content type of the storage blob. Cannot be defined if source_uri is defined. Defaults to application/octet-stream"
}
variable "storage_type" {
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
}

variable "storage-account-name" {
  description = "The name of the storage account"
}

variable "index_document" {
  description = "The index document of the static website"
}
variable "error_404_document" {
  description = "The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file"
}
variable "source_content" {
  description = "This is the source content for the static website"
}

variable "error_source" {
  description = "An absolute path to a file on the local system. This field cannot be specified for Append blobs and cannot be specified if source_content or source_uri is specified"
}

variable "account_tier" {
  description = "This is account tier for the storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  description = "This is account replication type for the storage account"
  default     = "LRS"
}

variable "account_kind" {
  description = "This is account kind for the storage account"
  default     = "StorageV2"
}

variable "cdnprofile-name" {
  description = "This is CDN Profile name"
}

variable "cdnprofile-sku" {
  description = "This is SKU of the CDN Profile"
}

variable "cdn-endpoint-name" {
  description = "Name of the CDN Endpoint Profile"
}

variable "environment" {
  description = "Environment"
}

variable "cost_center" {
  description = "Cost center"
}

# variable "ttl" {
#   description = "The Time To Live (TTL) of the DNS record in seconds."
# }

# variable "cname" {
#   description = "The name of the DNS CNAME Record"
# }

# variable "domain" {
#   description = "The name of the DNS Zone. Must be a valid domain name"
# }

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_name" {
  description = "Cloudflare record name"
  type        = string
}

variable "cloudflare_type" {
  description = "The type of the record"
  type        = string
}