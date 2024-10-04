resource "azurerm_service_plan" "res-3" {
  location            = "westeurope"
  name                = "ASP-ppo-test-webapp"
  os_type             = "Windows"
  resource_group_name = azurerm_resource_group.rg_web_app.name
  sku_name            = "B1"
}
resource "azurerm_windows_web_app" "res-4" {
  client_affinity_enabled                        = true
  ftp_publish_basic_authentication_enabled       = false
  https_only                                     = true
  location                                       = "westeurope"
  name                                           = "ppo-test-webapp-45"
  resource_group_name                            = azurerm_resource_group.rg_web_app.name
  service_plan_id                                = azurerm_service_plan.res-3.id
  webdeploy_publish_basic_authentication_enabled = false
  site_config {
    ftps_state                        = "FtpsOnly"
  }
}

