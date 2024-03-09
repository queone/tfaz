
variable "res_groups" {
  description = "List of Azure resource groups to be managed."
  type = list(object({
    name_prefix = string
    name        = string
    location    = optional(string)
    tags        = optional(map(string))
  }))
}
