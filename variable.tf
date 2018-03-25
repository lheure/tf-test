# azure service principal info
variable "subscription_id" {
  default = "2b9d8a3b-eb6c-455c-a6b8-71c72a38ef37"  #VisionCloud_STG
}

# client_id or app_id
variable "client_id" {
  default = "324df4db-0dfc-4c69-bf32-35396185304e"
}

variable "client_secret" {
  default = "2f4097b3-20eb-495f-acc6-bc5dd8de8750"
}

# tenant_id or directory_id
variable "tenant_id" {
  default = "39dc328f-9f54-4529-aff7-2ae4e3bf292c"
}

# # admin password
# variable "admin_username" {
#   default = "azureuser"
# }

# variable "admin_keydata" {
#   default = "add_here"
# }

# variable "admin_password" {
#   default = "add_here"
# }

# service variables
variable "prefix" {
  default = "vision-poc"
}

variable "location" {
  default = "westus2"
}

# variable "vmsize" {
#   default = "Standard_DS1_v2"
# }

# variable "osimageuri" {
#   default = "add_here"
# }

# variable "webcount" {
#   default = 1
# }

# variable "appcount" {
#   default = 1
# }

variable "tag" {
  default = "poc"
}