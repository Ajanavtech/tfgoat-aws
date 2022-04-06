

provider "azurerm" {
  #subscription_id = "df43b9ea-cec5-46f2-ace2-622430cfc26d"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
