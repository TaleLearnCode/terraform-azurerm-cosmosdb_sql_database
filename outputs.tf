# #############################################################################
# Outputs
# #############################################################################

output "database" {
  value       = azurerm_cosmosdb_sql_database.target
  description = "The managed Cosmos DB SQL database."
}

output "app_configuration_key" {
  value       = var.app_configuration_key == "null" ? null : var.app_configuration_key
  description = "The name of the key in the App Configuration Store that contains the name of the database."
}

output "app_configuration_label" {
  value       = var.app_configuration_label
  description = "The labels in the App Configuration Store in which to store the database name."
}