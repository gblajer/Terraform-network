
data "azurerm_resource_group" "main_rg" {
  name = var.resource_group_name
}

resource "azurecaf_naming_convention" "cafrandom_vnet" {  
  name    = "vda"
  prefix  = "poc"
  resource_type    = "vnet"
  postfix = "001"
  max_length = 23
  convention  = "cafrandom"
}

resource "azurecaf_naming_convention" "cafrandom_snet" {  
  name    = "vda"
  prefix  = "poc"
  resource_type    = "snet"
  postfix = "001"
  max_length = 23
  convention  = "cafrandom"
}