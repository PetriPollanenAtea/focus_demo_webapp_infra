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
   auth_settings {
     default_provider = "BuiltInAuthenticationProviderGithub"
     github {
       client_id = "Ov23liqRtcme7iYxE9MF"
       client_secret = "5dd9780980fdc27a3d94dee7d17aac6710318cf2"
     }
   }
}

# Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = "https://github.com/PetriPollanenAtea/focus_demo_webapp_application/"
  branch             = "main"
  use_manual_integration = false
  use_mercurial      = false
}

resource "azurerm_source_control_token" "example" {
  type  = "GitHub"
  # token = var.github_token
  token = "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"
}