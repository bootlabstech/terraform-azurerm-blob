variable "sa_name" {
  description = "Contains the name of the initial database of this instance that was provided at create time,"
  type        = string

}
variable "resource_group_name" {
  description = "Provides the name of the database engine to be used for this DB instance."
  type        = string

}
variable "location" {
  description = " Database engine version."
  type        = string

}
variable "sa_tier" {
  description = "Contains the master username for the DB instance"
  type        = string
  default = "Standard"

}
variable "sa_account_replication_type" {
  description = "Contains the password for the DB instance"
  type        = string

}
variable "sa_container_name" {
  description = "Contains the name of the compute and memory capacity class of the DB instance"
  type        = string

}
variable "container_access_type" {
  description = "Storage type associated with DB instance."
  type        = string
  default = "blob"

}
variable "name" {
  description = "Allocated storage size specified in gigabytes"
  type        = string

}
variable "blob_type" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string

}
variable "allow_nested_items_to_be_public" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string
  default = true

}
variable "public_network_access_enabled" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string
  default = true

}
variable "account_kind" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string

}