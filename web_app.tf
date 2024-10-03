# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "asp-focus-demo-webapp"
  location            = azurerm_resource_group.rg_web_app.location
  resource_group_name = azurerm_resource_group.rg_web_app.name
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "focus-demo-webapp"
  location              = azurerm_resource_group.rg_web_app.location
  resource_group_name   = azurerm_resource_group.rg_web_app.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config {
    application_stack {
      node_version = "20-lts"
    }
   }
}

#  Deploy code from a public GitHub repo
# resource "azurerm_app_service_source_control" "sourcecontrol" {
#   app_id             = azurerm_windows_web_app.webapp.id
#   repo_url           = "https://github.com/PetriPollanenAtea/focus_demo_web_app/"
#   branch             = "main"
#   use_manual_integration = true
#   use_mercurial      = false
# }