#ID subskrypcji
variable "sub_id" {
  type        = string
  default     = "8c42b3e1-e80e-4556-956c-fb4c9ced0810"
  description = "ID"
}
variable "resource_group_name" {
  type    = string
  default = "WVD-TEST"
}

variable "VD_CIDR_RANGE" {
  default     = "192.168.88.0/21"
  type        = string
  description = "Prefix for Virtual Network vd-network"
}

locals {
  #definicja VNET + SUBNET sieci DC oraz Bastion
  DC_CIDR_RANGE_VNET        = "192.168.87.0/24"
  DC_CIDR_RANGE_SUBNET      = "192.168.87.0/25"
  BASTION_CIDR_RANGE_SUBNET = "192.168.87.128/25"
  #definicja VNET + SUBNET sieci dla rozwiazania Virtual Desktop
  VD_CIDR_RANGE_VNET           = "192.168.88.0/21"
  CS_CIDR_RANGE_SUBNET         = "192.168.88.0/24"
  LINUXVDI_CIDR_RANGE_SUBNET   = "192.168.89.0/24"
  WINDOWSVDI_CIDR_RANGE_SUBNET = "192.168.90.0/24"
  MGMT_CIDR_RANGE_SUBNET       = "192.168.91.0/24"
}