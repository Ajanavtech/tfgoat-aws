
################################  App Service Plan   #######################################
resource_group        = "rg-SPM051"
asp_name              = "aspazewdapmt01proj"
location              = "West europe"
kind                  = "Windows"
tier                  = "Free"
size                  = "F1"
per_site_scaling      = false
custom_tags = {
  environment  = "dev",
  businessunit = "Proj"
}
ip_address = [
  {
    ip_address = "0.0.0.0/0"
  }
]

appname        = "apsazewdapmt01project"
app_service_plan_id     =""
SPRING_PROFILE = "dev"
application_type = "web"
insightname      = "ainazewdapmt001proj"

connection_string = [{
  name  = "Database"
  type  = "SQLServer"
  value = "Server=tcp:sqlservername,1433;Database=mastertest;"
}]
site_config   = [{
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }]



  ################################ App Insights    #######################################
  Insights_name                 = "ainazewdapmt001proj"
  Insights_location             = "WestEU"
  Insights_resource_group_name  = "rg-SPM051"
  Insights_application_type     = "web"



  ################################ App Key Vault    #######################################
  key_vault_name                    = "kyvazewdapmt01Proj"
  key_vault_location                = "WestEU"
  key_vault_resource_group_name     = "rg-SPM051"
  key_vault_enabled_for_disk_encryption = true
  key_vault_sku_name                = "standard"
  key_vault_access_policy           = 