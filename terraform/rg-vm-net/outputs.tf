## Este output nos va a devolver el id del grupo de recursos
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

## Este output nos va a devolver el id de la vm que acabamos de crear
output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

## Este output nos va a devolver el nombre de la vm que acabamos de crear
output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}