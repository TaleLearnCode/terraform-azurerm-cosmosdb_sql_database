variable "environment" {
  type        = string
  default     = "DEV"
  description = "The environment for the resource."
}

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "North Central US"
}

data "azurerm_app_configuration" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

data "azurerm_cosmosdb_account" "example" {
  name                = "tfex-cosmosdb-account"
  resource_group_name = "tfex-cosmosdb-account-rg"
}

module "example" {
  source  = "TaleLearnCode/cosmosdb_sql_database/azurerm"
  version = "0.0.1-pre"
  providers = {
    azurerm = azurerm
  }

  name                = "AutoScaledDB"
  resource_group_name = data.azurerm_cosmosdb_account.example.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.example.name
  max_throughput      = 2000

  record_database_name_in_app_configuration = true
  configuration_store_id                    = data.azurerm_app_configuration.example.id
  app_configuration_key                     = "databaseName"
  app_configuration_label                   = [ "dev" ]
}