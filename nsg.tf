resource "azurerm_network_security_group" "nsg_dc_subnet_dc_vnet" {
  name                = join("-", ["dc", azurecaf_naming_convention.cafclassic_nsg.result])
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  security_rule {
    name                         = "NTPSyncPrimaryDomainController"
    priority                     = 100
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "UDP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "123"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADRPCPrimaryDC"
    priority                     = 101
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "135"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADKerberoschangePrimaryDC"
    priority                     = 102
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "464"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADLDAPPrimaryDC"
    priority                     = 103
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "389"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADLDAPGCPrimaryDC"
    priority                     = 104
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "3268"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADDNSPrimaryDC"
    priority                     = 105
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "53"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADKerberosPrimaryDC"
    priority                     = 106
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "88"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADSMBPrimaryDC"
    priority                     = 107
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "445"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "ADDYNPrimaryDC"
    priority                     = 108
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "49152-65535"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "LDAPGCSSL"
    priority                     = 109
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "3269"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                         = "LDAPSSLTCP"
    priority                     = 110
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "TCP"
    destination_address_prefixes = [local.DC_CIDR_RANGE_SUBNET]
    destination_port_range       = "636"
    source_address_prefixes      = [local.CS_CIDR_RANGE_SUBNET, local.LINUXVDI_CIDR_RANGE_SUBNET, local.WINDOWSVDI_CIDR_RANGE_SUBNET, local.MGMT_CIDR_RANGE_SUBNET]
    source_port_range            = "*"
  }
  security_rule {
    name                       = "blockall"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "nsg_dc_subnet_dc_vnet_assocation" {
  subnet_id                 = azurerm_subnet.dc-subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_dc_subnet_dc_vnet.id
}