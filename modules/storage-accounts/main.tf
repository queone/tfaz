
# locals {
#   res_groups_updated = [for i, rg in var.res_groups : {
#     name        = rg.name
#     location    = rg.location != null && rg.location != "" ? rg.location : "eastus"
#     tags        = rg.tags != null ? rg.tags : {}
#   }]
# }

# resource "azurerm_storage_accounts" "sa" {
#   count    = length(local.res_groups_updated)
#   name     = "${local.res_groups_updated[count.index].name}"
#   location = local.res_groups_updated[count.index].location
#   tags     = local.res_groups_updated[count.index].tags
# }
