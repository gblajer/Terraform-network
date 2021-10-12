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
  default = "192.168.88.0/21"
  type    = string
}