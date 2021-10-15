
data "azurerm_resource_group" "main_rg" {
  name = var.resource_group_name
}

resource "azurecaf_naming_convention" "cafclassic_vnet" {
  name          = "vda"
  prefix        = "poc"
  resource_type = "vnet"
  postfix       = "001"
  max_length    = 23
  convention    = "cafclassic"
}

resource "azurecaf_naming_convention" "cafclassic_snet" {
  name          = "vda"
  prefix        = "poc"
  resource_type = "snet"
  postfix       = "001"
  max_length    = 23
  convention    = "cafclassic"
}

resource "azurecaf_naming_convention" "cafclassic_nsg" {
  name          = "vda"
  prefix        = "poc"
  resource_type = "nsg"
  postfix       = "001"
  max_length    = 23
  convention    = "cafclassic"
}