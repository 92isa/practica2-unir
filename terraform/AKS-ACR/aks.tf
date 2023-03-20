# Creación del cluster k8s

resource "azurerm_kubernetes_cluster" "AKS" {
  name                = "AKS-pracisa"
  location            = var.location_name
  resource_group_name = var.resource_group_name
  dns_prefix          = "DNS-PRAC"

## Definicion de los nodos del cluster
  default_node_pool {
    name       = "clusternodes"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  tags = {
    Environment = "Staging"
  }
}

  ## Descarga del fichero kubeconfig para la conexión contra el cluster k8s
  resource "local_file" "kubeconfig" {
    depends_on = [azurerm_kubernetes_cluster.AKS]
    filename   = "kube.conf"
    content    = azurerm_kubernetes_cluster.AKS.kube_config_raw
}
