# Create resource groups for environment
resource "azurerm_resource_group" "rg_web_app" {
  provider = azurerm
  location = var.location
  name = "rg-focus-demo-webapp"
}
