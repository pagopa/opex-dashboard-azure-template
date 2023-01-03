resource "azuread_application" "master" {
  display_name = "${local.app_name}-master"
}

resource "azuread_service_principal" "master" {
  application_id = azuread_application.master.application_id
}

resource "azuread_application_federated_identity_credential" "master" {
  application_object_id = azuread_application.master.object_id
  display_name          = "github-federated"
  description           = "github-federated"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${var.github.org}/${var.github.repository}:ref:refs/heads/master"
}

output "azure_master" {
  value = {
    app_name       = "${local.app_name}-master"
    client_id      = azuread_service_principal.master.application_id
    application_id = azuread_service_principal.master.application_id
    object_id      = azuread_service_principal.master.object_id
  }
}