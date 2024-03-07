variable "ad_groups" {
  description = "List of Azure AD groups to be managed."
  type        = list(object({
    display_name  = string
    group_owners  = list(string)
    group_members = list(string)
  }))
}
