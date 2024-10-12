# Azure Cosmos DB NoSQL Database Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md)

This module manages Azure Cosmos DB NoSQL databases using the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest) Terraform provider.

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 4.1. |

## Modules

No modules.

## Resources

No resources.

## Usage

```hcl
module "example" {
  source  = "TaleLearnCode/cosmosdb_sql_database/azurerm"
  version = "0.0.1-pre"
  providers = {
    azurerm = azurerm
  }

  name                = "ProvisionedDB"
  resource_group_name = data.azurerm_cosmosdb_account.example.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.example.name
  throughput          = 400

  record_database_name_in_app_configuration = true
  configuration_store_id                    = data.azurerm_app_configuration.example.id
  app_configuration_key                     = "databaseName"
  app_configuration_label                   = [ "dev" ]
}
```

For more detailed instructions on using this module: please refer to the appropriate example:

- [Autoscaled](examples/autoscaled/README.md)
- [Provisioned](examples/provisioned/README.md)
- [Serverless](examples/serverless/README.md)

## Inputs

| Name                                  | Description                                                  | Type              | Default            | Required |
| ------------------------------------- | ------------------------------------------------------------ | ----------------- | ------------------ | -------- |
| app_configuration_key | The key in the App Configuration Store in which to store the database name. This is required if `record_database_name_in_app_configuration` is set to true. | string | null | no |
| app_configuration_label | The label(s) in the App Configuration Store in which to store the database name. | list(string) | []] | no |
| account_name | The name of the Cosmos DB account in which to create the SQL Database. | string | N/A | **yes** |
| name            | The name of the Cosmos DB NoSQL database. | string         | N/A            | **yes** |
| configuration_store_id | The ID of the App Configuration Store in which to store the database name. This is required if `record_database_name_in_app_configuration` is set to true. | string | null | no |
| max_throughput | The maximum throughput of the Cosmos DB SQL Database. | number | null | no |
| record_database_name_in_app_configuration | Should the database name be recorded in the App Configuration? Defaults to false. | bool | false | no |
| resource_group_name | The name of the Resource Group containing the Cosmos DB account in which to create the SQL database. | string | N/A | **yes** |
| throughput | The throughput of the Cosmos DB SQL Database. | number | null | no |


## Outputs

| Name                     | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| database                 | The managed Azure Cosmos DB NoSQL database.                  |
| app_configuration_key    | The name of the key in the App Configuration Store that contains the name of the database. |
| app_configuration_labels | The labels in the App Configuration Store in which to store the database name. |

## Naming Guidelines

| Guideline                       |                                               |
| ------------------------------- | --------------------------------------------- |
| Resource Type Identifier        | N/A                                           |
| Scope                           | Cosmos DB Account                             |
| Max Overall Length              | 1 - 256 characters                            |
| Allowed Component Name Length * | N/A                                           |
| Valid Characters                | Alphanumeric and hyphens                      |
| Regex                           | `^(?!-)(?!.*--)[A-Za-z0-9]+(-[A-Za-z0-9]+)*$` |