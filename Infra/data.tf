data "azurerm_resource_group" "main_rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "dc_subnet" {
    name = var.dc_subnet_name
}