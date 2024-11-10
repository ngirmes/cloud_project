# Define the primary resources for my application, such as Azure Functions, Cosmos DB, and any other necessary Azure resources.
# Defines what should exist in Azure pre deployment

#Define resource group
resource "azurerm_resource_group" "rg" {
  name     = "wordle-resources"
  location = "West US"
}

# Define storage account for function app
resource "azurerm_storage_account" "sa" {
  name                     = "wordlegamestorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Define the App Service Plan (consumption-based for serverless functions)
resource "azurerm_service_plan" "sp" {
  name                = "wordle-app-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "Y1"
}

# Define the Function App
resource "azurerm_function_app" "fa" {
  name                       = "wordle-game-api"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  os_type                    = "Windows"

  site_config {}
}
