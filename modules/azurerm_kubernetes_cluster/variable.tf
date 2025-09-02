variable "k8s_name" {}
variable "location" {}  
variable "tags" {}
variable "rg_name" {}
variable "dns_prefix" {}  
variable "node_count" {
    default = 1
  
}
variable "vm_size" {
    default = "Standard_D2_v2"
  
}