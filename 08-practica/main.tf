# WorkSpaces
# terraform workspace list # listar los workspaces
# terraform workspace show # mostrar el workspace en el que estoy trabajando actualmente
# terraform workspace new dev # Crear un WorkSpace
# terraform workspace select qa # Seleccionar un Workspace
# terraform workspace delete qa # Eliminar un workspace


resource "azurerm_resource_group" "rg" {
  name     = "dalvinder-rg-${terraform.workspace}"
  location = "eastus"
}
