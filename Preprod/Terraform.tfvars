preprod_rg = {
  rg1 = {
    name     = "rg1"
    location = "East US"
  }
  rg2 = {
    name     = "rg2"
    location = "East US"
  }

}

preprod_sa = {

  sa1 = {
    name                     = "sa1"
    resource_group_name      = "rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }

}