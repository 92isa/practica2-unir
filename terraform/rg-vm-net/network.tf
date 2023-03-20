# Definimos la red para la vm, nombre, rango de ips, region donde se va a ubicar y el grupo de recursos
resource "azurerm_virtual_network" "vnet" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Definimos la subnet, su nombre, rango, la vnet a la que pertenece y la region donde se va a ubicar
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Configuración de la IP publica
resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  sku = "Basic"
}

# Definimos la nic, su nombre, region donde la vamos a ubicar y el nombre
resource "azurerm_network_interface" "nic" {
  name                = var.vnic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.public_ip.id
  }
}


# Creación de security group, abriendo el puerto 22 para podernos conectar por SSH a la vm y el 8080 para el servidor web
resource "azurerm_network_security_group" "nsg" {
  name                = "SG_VM"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_http"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
}

# Añadir el sg a la nic

resource "azurerm_network_interface_security_group_association" "SG_NIC" {
  network_interface_id      = azurerm_network_interface.nic.id     
  network_security_group_id = azurerm_network_security_group.nsg.id
}