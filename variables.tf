variable "resource_group" {
  description = "The resources which are needed to be deployed in the resource group"
}

variable "asp_name" {
  type = string
  description = "The App service plan name declare here"
}

variable "location" {
  type = string
  description = "Location is same to all resources"
}

variable "kind" {
  type = string
  description = "Kind of operating need to be declared"
}

variable "per_site_scaling" {
  type = string
  description = "scaling has to describe"
}
variable "asp_tier" {
  type = string
  description = "App service plan sku value declared"
}

variable "asp_size" {
  type = string
  description = "App service plan sku value declared"
}

variable "app_name" {
  type = string
  description = "app service name declared"
}

variable "insights_name" {
  type = string
  description = "App insights name declared"
}

variable "vault_name" {
  type = string
  description = "Key vault name declared"
}

variable "Vault_tenant_id" {
  type = string
  description = "Azure tenant id for identificaton"
}

variable "vault_sku_name" {
  type = string
  description = "Key Vault sku name declared"
}

variable "Vault_object_id" {
  type = string
  description = "Object Id for subscription identification"
}

variable "sql_server_name" {
  type = string
  description = "Sql server name declared"
}

variable "admin_login_id" {
  type = string
  description = "SQL server login admin id"
}

variable "admin_pass" {
  type = string
  description = "SQL server login password"
}

variable "sql_server_tags" {
  type = string
  description = "decribe environment type"
}

variable "db_name" {
  type = string
  description = "SQL database name declared"
}

variable "App_intent" {
  type = string
  description = "SQL database replication type need to assign"
}

variable "db_tags" {
  type = string
  description = "database environment type"
}

variable "stoacc_name" {
  type = string
  description = "Storage account name"
}

variable "account_tier" {
  type = string
  description = "(optional) describe your variable"
}
variable "account_replic" {
  type = string
  description = "(optional) describe your variable"
}

variable "container_name" {
  type = string
  description = "(optional) describe your variable"
}

variable "container_access" {
  type = string
  description = "(optional) describe your variable"
}

variable "blob_name" {
  type = string
  description = "(optional) describe your variable"
}

