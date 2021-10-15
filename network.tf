#Wirtualne sieci

resource "azurerm_virtual_network" "vd-network" {
  name                = join("-", ["vd", azurecaf_naming_convention.cafclassic_vnet.result])
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space       = [local.VD_CIDR_RANGE_VNET]
  #dns_servers        = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_virtual_network" "dc-network" {
  name                = join("-", ["dc", azurecaf_naming_convention.cafclassic_vnet.result])
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space       = [local.DC_CIDR_RANGE_VNET]
}

#subnety
resource "azurerm_subnet" "dc-subnet" {
  name                 = join("-", ["dc", azurecaf_naming_convention.cafclassic_snet.result])
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.dc-network.name
  address_prefixes     = [local.DC_CIDR_RANGE_SUBNET]
}
resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.dc-network.name
  address_prefixes     = [local.BASTION_CIDR_RANGE_SUBNET]
}

resource "azurerm_subnet" "cs-subnet" {
  name                 = join("-", ["cs", azurecaf_naming_convention.cafclassic_snet.result])
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = [local.CS_CIDR_RANGE_SUBNET]

}

resource "azurerm_subnet" "linuxvdi-subnet" {
  name                 = join("-", ["linuxvdi", azurecaf_naming_convention.cafclassic_snet.result])
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = [local.LINUXVDI_CIDR_RANGE_SUBNET]
}

resource "azurerm_subnet" "windowsvdi-subnet" {
  name                 = join("-", ["windowsvdi", azurecaf_naming_convention.cafclassic_snet.result])
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = [local.WINDOWSVDI_CIDR_RANGE_SUBNET]
}

resource "azurerm_subnet" "mgmt-subnet" {
  name                 = join("-", ["mgmt", azurecaf_naming_convention.cafclassic_snet.result])
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = [local.MGMT_CIDR_RANGE_SUBNET]
}
