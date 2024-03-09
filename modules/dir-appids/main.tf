
locals {
  dir_appids = var.dir_appids != null ? var.dir_appids : []
}

resource "azuread_application" "app" {
  for_each = { for app in local.dir_appids : app.display_name => app }

  display_name            = each.value.display_name
  owners                  = each.value.owners
  prevent_duplicate_names = true
}

resource "azuread_service_principal" "sp" {
  for_each = { for sp in local.dir_appids : sp.display_name => sp }

  client_id = azuread_application.this[each.key].client_id
  owners    = each.value.owners
}
