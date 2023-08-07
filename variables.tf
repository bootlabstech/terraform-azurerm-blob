variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account where the Container should be created."

}
variable "sa_container_name" {
  type        = string
  description = "The name of the Container which should be created within the Storage Account."


}
variable "container_access_type" {
  type        = string
  description = "The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."

}
variable "name" {
  type        = string
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. "

}
variable "type" {
  type        = string
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page"


}
variable "size" {
  type        = string
  description = "Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512. Defaults to 0"
  default = "0"


}
variable "access_tier" {
  type        = string
  description = " The access tier of the storage blob. Possible values are Archive, Cool and Hot."

}
