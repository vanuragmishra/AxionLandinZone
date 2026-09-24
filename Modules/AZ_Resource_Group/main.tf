resource "azurerm_resource_group" "rg" {
    for_each = var.vgs_rgs
    name = each.value.name
    location = each.value.location
}  
