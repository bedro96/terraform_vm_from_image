variable "resourcegroup_name" {
  description = "The name of resource group"
  default = "terraformrg"
}
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "southeastasia"
}
variable "ssh_username" {
  description = "ssh username."
}
variable "ssh_password" {
  description = "ssh password."
}
variable "ssh_port" {
  description = "ssh Port."
  default = "22"
}
variable "vm_size" {
  description = "The vm SKU"
  default = "Standard_B2ms"
}
variable "managed_image_resourcegroup_name" {
  description = "The name of resource group, where managed image will be created"
  default = "test-imgrepo-rg"
}
variable "managed_image_name" {
  description = "The name of managed image to be created."
  default = "imgtestwithdatadisk"
}