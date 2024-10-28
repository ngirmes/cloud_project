# Define the primary resources for my application, such as Azure Functions, Cosmos DB, and any other necessary Azure resources.
# Defines what should exist in Azure pre deployment

#Specify Provider
provider "Azure" {
  features {}
}

#Define resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-wordle-game"
  location = "West US"
}

# Define storage account for function app
resource "azurerm_storage_account" "storage" {
  name                     = "wordlegamestorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true # Prevents accidental deletion of storage
  }
}

# Define the App Service Plan (consumption-based for serverless functions)
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "wordle-game-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Dynamic"
    size = "Y1" # The pricing tier for consumption plan
  }
}

# Define the Function App
resource "azurerm_function_app" "function_app" {
  name                       = "wordle-game-api"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  os_type                    = "Linux"
  runtime_stack              = "python"

  # Set environment variables
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "AzureWebStorage"          = azurerm_storage_account.storage.primary_connection_string
  }

  identity {
    type = "SystemAssigned" # Enable managed identity for secure access to other Azure resources
  }
}
