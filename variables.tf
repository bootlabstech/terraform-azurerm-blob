variable "storage_account_name" {
  type        = string
  description = "Specifies the storage account in which to create the storage container. Changing this forces a new resource to be created."
}
variable "sa_container_name" {
  type        = string
  description = "The name of the storage container in which this blob should be created."
}
variable "container_access_type" {
  type        = string
  description = "The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."
}
variable "name" {
  type        = string
  description = "The name of the storage blob. Must be unique within the storage container the blob is located."
}
variable "type" {
  type        = string
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Defaults to Block"
}
variable "size" {
  type        = string
  description = "Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512. Defaults to 0"
  default     = "0"
}
variable "access_tier" {
  type        = string
  description = " The access tier of the storage blob. Possible values are Archive, Cool and Hot."

}
