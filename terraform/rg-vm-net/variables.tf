## Variable para el nombre del grupo de recursos
variable "resource_group_name" {
  default = "rg-prac2"
}

## Variable para la ubicacion de la region de azure
variable "location_name" {
  default = "West Europe"
}

## Variable para el nombre de la red virtual
variable "network_name" {
  default = "vnet-prac2"
}

## Variable para el nombre de la subred
variable "subnet_name" {
  default = "subnet-prac2"
}

## Variable para el nombre de la interfaz de red virtual
variable "vnic_name" {
  default = "vnic-prac2"
}