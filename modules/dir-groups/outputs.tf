output "group_ids" {
  value       = { for name, group in azuread_group.group : name => group.id }
  description = "Map of the IDs of the created Azure AD groups."
}
