variable "preprod_rg" {}
variable "preprod_sa" {}

module "resource_group" {
  source = "../Modules/AZ_Resource_Group"
  m_rg   = var.preprod_rg
}

module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../Modules/AZ_Storage_Account"
  m_sa       = var.preprod_sa
} 