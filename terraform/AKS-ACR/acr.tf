# Creación del ACR

resource "azurerm_container_registry" "acr" {
  name                = "ACRpracIsa"
  resource_group_name = var.resource_group_name
  location            = var.location_name
  sku                 = "Standard"
  admin_enabled       = true
}

# Conectar el cluster AKS con el ACS
resource "azurerm_role_assignment" "enlaceACRAKS" {
  principal_id                     = azurerm_kubernetes_cluster.AKS.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
