variable "sub_id" {
  type        = string
  default     = "8c42b3e1-e80e-4556-956c-fb4c9ced0810"
  description = "ID"
}
variable "resource_group_name" {
  type    = string
  default = "WVD-TEST"
}

variable "prefix" {
  description = "The prefix used for all resources in this example. Needs to be a short (6 characters) alphanumeric string. Example: `myprefix`."
  type = string
  default = "dc"
}

variable "private_ip_address" {
  description = "The private IP address for the Domain Controller's NIC"
}

variable "active_directory_domain" {
  description = "The name of the Active Directory domain, for example `consoto.local`"
}

variable "active_directory_netbios_name" {
  description = "The netbios name of the Active Directory domain, for example `consoto`"
}

variable "admin_username" {
  description = "The username associated with the local administrator account on the virtual machine"
}

variable "admin_password" {
  description = "The password associated with the local administrator account on the virtual machine"
}