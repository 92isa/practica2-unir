## Certificado cliente del kubeconfig
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.AKS.kube_config.0.client_certificate
  sensitive = true
}

## Este output nos proporciona el kubeconfig con el que luego vamos a poder conectarnos al cluster
output "kube_config" {
  value = azurerm_kubernetes_cluster.AKS.kube_config_raw
  sensitive = true
}

output "acr_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_pass" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}