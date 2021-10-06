resource "azurerm_virtual_network_peering" "peering_dc-network_bastion-network" {
  name                      = "peering_dc-network_bastion-network"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.dc-network.name
  remote_virtual_network_id = azurerm_virtual_network.bastion-network.id
  allow_forwarded_traffic   = false
  allow_gateway_transit     = false
  use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peering_bastion-network_dc-network" {
  name                      = "peering_bastion-network_dc-network"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.bastion-network.name
  remote_virtual_network_id = azurerm_virtual_network.dc-network.id
  allow_forwarded_traffic   = false
  allow_gateway_transit     = false
  use_remote_gateways       = false
}
resource "azurerm_virtual_network_peering" "peering_dc-network_vd-network" {
  name                      = "peering_dc-network_vd-network"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.dc-network.name
  remote_virtual_network_id = azurerm_virtual_network.vd-network.id
  allow_forwarded_traffic   = false
  allow_gateway_transit     = false
  use_remote_gateways       = false
}

resource "azurerm_virtual_network_peering" "peering_vd-network_dc-network" {
  name                      = "peering_vd-network_dc-network"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.vd-network.name
  remote_virtual_network_id = azurerm_virtual_network.dc-network.id
  allow_forwarded_traffic   = false
  allow_gateway_transit     = false
  use_remote_gateways       = false
}