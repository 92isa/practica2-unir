# Primero se va a indicar la creación del grupo de recursos donde va a ir la vm y su red, subred, interfaz y sg
# Luego las caracteristicas que queremos que tenga la vm que vamos a crear

# Definimos el grupo de recursos, su nombre y la región donde se va a ubicar
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location_name
  tags = {
  environment = "Staging"
  }
}

# Definimos la vm que vamos a crear y sus caracteristicas, la region, su nombre, el tamaño, su usuario de admin, donde vamos a ubicar su key, el tipo de disco, el SO y las etiquetas
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-podman"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "azure-user"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "azure-user"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku = "20_04-lts-gen2"
    version = "20.04.202209050"
  }

  tags = {
    environment = "Staging"
  }
}