variable "storage_account_name" {
  type        = string
  description = "value"

}
variable "resource_group_name" {
  type        = string
  description = "value"

}
variable "container_name" {
  type        = string
  description = "value"


}
variable "no_of_blob" {
  type        = string
  description = "value"

}
variable "name_of_blobs" {
  type        = list(string)
  description = "value"

}
variable "type" {
  type        = string
  description = "value"


}
variable "size" {
  type        = string
  description = "value"
  default = "0"


}
variable "access_tier" {
  type        = string
  description = "value"

}
variable "parallelism" {
  type        = string
  description = "value"
  default = "8"

}