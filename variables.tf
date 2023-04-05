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
  type        = number
  description = "value"
}
variable "name_of_blobs" {
  type        = list(string)
  description = "value"
}
variable "type" {
  type        = string
  description = "value"
  default = "Page"
}
variable "size" {
  type        = number
  description = "value"
}
# variable "access_tier" {
#   type        = string
#   description = "value"
#   default = "Hot"
# }
