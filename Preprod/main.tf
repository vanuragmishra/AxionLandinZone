variable "preprod_rg" {}

module "resource_group" {
    source = "../Modules/AZ_Resource_Group"
    m_rg = var.preprod_rg
  
}