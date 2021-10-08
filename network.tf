#Wirtualne sieci

resource "azurerm_virtual_network" "vd-network" {
  #name               = "vd-network"
  name                = join("-",["vd",azurecaf_naming_convention.cafrandom_vnet.result]) 
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space       = ["192.168.88.0/21"]
  #dns_servers        = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_virtual_network" "bastion-network" {
  #name = "bastion-network"
  name = join("-",["bastion",azurecaf_naming_convention.cafrandom_vnet.result]) 
  location = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space = ["10.46.145.0/26"]
}
resource "azurerm_virtual_network" "dc-network" {
  #name = "dc-network"
  name = join("-",["dc",azurecaf_naming_convention.cafrandom_vnet.result]) 
  location = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space = ["192.168.87.0/24"]
}

#subnety
resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.bastion-network.name
  address_prefixes     = azurerm_virtual_network.bastion-network.address_space
}
resource "azurerm_subnet" "dc-subnet" {
  name                 = join("-",["dc",azurecaf_naming_convention.cafrandom_snet.result]) 
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.dc-network.name
  address_prefixes     = azurerm_virtual_network.dc-network.address_space
}
resource "azurerm_subnet" "cs-subnet" {
  name                 = join("-",["cs",azurecaf_naming_convention.cafrandom_snet.result]) 
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.88.0/24"]
}

resource "azurerm_subnet" "linuxvdi-subnet" {
  name                 = join("-",["linuxvdi",azurecaf_naming_convention.cafrandom_snet.result]) 
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.89.0/24"]
}

resource "azurerm_subnet" "windowsvdi-subnet" {
  name                 = join("-",["windowsvdi",azurecaf_naming_convention.cafrandom_snet.result]) 
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.90.0/24"]
}

resource "azurerm_subnet" "mgmt-subnet" {
  name                 = join("-",["mgmt",azurecaf_naming_convention.cafrandom_snet.result]) 
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.91.0/24"]
}
