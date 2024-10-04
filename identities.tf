resource "azurerm_user_assigned_identity" "res-1" {
  location            = "westeurope"
  name                = "ppo-focus-demo-webapp--id-9a09"
  resource_group_name = azurerm_resource_group.rg_web_app.name
}
resource "azurerm_federated_identity_credential" "res-2" {
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  name                = "lb5ylpeszh67a"
  parent_id           = "/subscriptions/323635f4-82ae-4b1a-a0fe-6a7d6f021834/resourceGroups/rg-focus-demo-webapp/providers/Microsoft.ManagedIdentity/userAssignedIdentities/ppo-focus-demo-webapp--id-9a09"
  resource_group_name = azurerm_resource_group.rg_web_app.name
  subject             = "repo:PetriPollanenAtea/focus_demo_webapp_application:environment:production"
  depends_on = [
    azurerm_user_assigned_identity.res-1,
  ]
}