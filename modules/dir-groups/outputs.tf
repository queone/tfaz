output "group_ids" {
  description = "Map of the IDs of the created Azure AD groups."
  value       = { for name, group in azuread_group.azure_dir_group : name => group.id }
}
