# #############################################################################
# Variables: Cosmos DB SQL Database
# #############################################################################

variable "name" {
  type        = string
  description = "The name of the Cosmos DB SQL Database."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group containing the Cosmos DB account in which to create the SQL database."
}

variable "account_name" {
  type        = string
  description = "The name of the Cosmos DB account in which to create the SQL Database."
}

variable "throughput" {
  type        = number
  nullable    = true
  default     = null
  description = "Throughput value which can be null or between 100 and 1000000 in increments of 100"
}

variable "max_throughput" {
  type        = number
  nullable    = true
  default     = null
  description = "The maximum throughput of the Cosmos DB SQL Database."
}

variable "record_database_name_in_app_configuration" {
  type        = bool
  default     = false
  description = "Should the database name be recorded in the App Configuration? Defaults to false."
}

variable "configuration_store_id" {
  type        = string
  default     = null
  description = "The ID of the App Configuration Store in which to store the database name. This is required if 'record_database_name_in_app_configuration' is set to true."
}

variable "app_configuration_key" {
  type        = string
  default     = null
  description = "The key in the App Configuration Store in which to store the database name. This is required if 'record_database_name_in_app_configuration' is set to true."
}

variable "app_configuration_label" {
  type        = list(string)
  default     = []
  description = "The labels in the App Configuration Store in which to store the database name."
}
