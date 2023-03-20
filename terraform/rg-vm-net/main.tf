# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }

  required_version = ">= 1.1.0"
}

## En el apartado del provider podriamos especificar parametros como la suscripción de azure, usuario y pass para conectarnos a azure y desplegar los recursos
## Al ser datos sensibles el login para el despliegue lo haremos con el comando az login

provider "azurerm" {
  features {}
}