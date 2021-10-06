resource "azurerm_virtual_network" "vd-network" {
  name                = "vd-network"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space       = ["192.168.88.0/21"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_virtual_network" "bastion-network" {
  name = "bastion-network"
  location = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space = ["10.46.145.0/26"]
}
resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.bastion-network.name
  address_prefixes     = azurerm_virtual_network.bastion-network.address_space
}

resource "azurerm_virtual_network" "dc-network" {
  name = "dc-network"
  location = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  address_space = ["192.168.87.0/24"]
}
resource "azurerm_subnet" "dc-subnet" {
  name                 = "dc-subnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.dc-network.name
  address_prefixes     = azurerm_virtual_network.dc-network.address_space
}
resource "azurerm_subnet" "cs-subnet" {
  name                 = "cs-subnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.88.0/24"]
}

resource "azurerm_subnet" "linuxvdi-subnet" {
  name                 = "linuxvdi-subnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.89.0/24"]
}

resource "azurerm_subnet" "windowsvdi-subnet" {
  name                 = "windowsvdi-subnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.90.0/24"]
}

resource "azurerm_subnet" "mgmt-subnet" {
  name                 = "mgmt-subnet"
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vd-network.name
  address_prefixes     = ["192.168.91.0/24"]
}
