locals {
  ad_groups = var.ad_groups != null ? var.ad_groups : []
}

resource "azuread_group" "group" {
  for_each = { for group in local.ad_groups : group.display_name => group }

  display_name            = each.value.display_name
  owners                  = each.value.group_owners
  security_enabled        = true
  prevent_duplicate_names = true

  members = each.value.group_members
}
