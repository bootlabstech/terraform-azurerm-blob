variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
}

variable "rg-name" {
  description = "The name of the resource group"
  type        = string
}

variable "lock_level" {
  description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created"
  default     = "ReadOnly"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container in which this blob should be created"
  type        = string
}
variable "storage_content_type" {
  description = "The content type of the storage blob. Cannot be defined if source_uri is defined. Defaults to application/octet-stream"
  type        = string
}
variable "storage_type" {
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
  type        = string
}

variable "storage-account-name" {
  description = "The name of the storage account"
  type        = string
}

variable "index_document" {
  description = "The index document of the static website"
  type        = string
}
variable "error_404_document" {
  description = "The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file"
  type        = string
}
variable "source_content" {
  description = "This is the source content for the static website"
  type        = string
}

variable "error_source" {
  description = "An absolute path to a file on the local system. This field cannot be specified for Append blobs and cannot be specified if source_content or source_uri is specified"
  type        = string
}

variable "account_tier" {
  description = "This is account tier for the storage account"
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "This is account replication type for the storage account"
  default     = "LRS"
  type        = string
}

variable "account_kind" {
  description = "This is account kind for the storage account"
  default     = "StorageV2"
  type        = string
}

variable "cdnprofile-name" {
  description = "This is CDN Profile name"
  type        = string
}

variable "cdnprofile-sku" {
  description = "This is SKU of the CDN Profile"
  type        = string
}

variable "cdn-endpoint-name" {
  description = "Name of the CDN Endpoint Profile"
  type        = string
}