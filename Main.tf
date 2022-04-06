

################# APP Service ######################
resource "azurerm_app_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group
  kind                = var.kind
  per_site_scaling    = var.per_site_scaling 
  sku {
    tier = var.asp_tier
    size = var.asp_size
  }
}

resource "azurerm_app_service" "apser" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group
  app_service_plan_id = azurerm_app_service_plan.apser.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.app_insights.instrumentation_key}"
  
  }

  connection_string {
    name  = var.db_name
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

####################### Insights ########################
resource "azurerm_application_insights" "app_insights" {
  name                = var.insights_name
  location            = var.location
  resource_group_name = var.resource_group
  application_type    = "web"
}



######################### Key Vault #########################
resource "azurerm_key_vault" "vault-web" {
  name                        = var.vault_name
  location                    = var.location
  resource_group_name         = var.resource_group
  enabled_for_disk_encryption = true
  tenant_id                   = var.Vault_tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

#################### SQL ########################
resource "azurerm_sql_server" "sql-ser" {
  name                         = var.sql_server_name
  resource_group_name          = var.location
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_login_id
  administrator_login_password = var.admin_pass

  tags = {
    environment = var.sql_server_tags
  }
}


resource "azurerm_sql_database" "sql-db" {
  name                = var.db_name
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = var.sql_server_name
  ApplicationIntent   = var.App_intent

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }



  tags = {
    environment = "production"
  }
}

######################## Storage #####################
resource "azurerm_storage_account" "stor_acc" {
  name                     = var.stoacc_name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.stor_acc.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}