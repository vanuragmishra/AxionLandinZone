variable "m_rg" {}

resource "azurerm_resource_group" "rg_block" {
  for_each = var.m_rg
  name     = each.value.name
  location = each.value.location
}
