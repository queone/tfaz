
variable "res_groups" {
  description = "List of Azure resource groups to be managed."
  type = list(object({
    name        = string
    location    = optional(string)
    tags        = optional(map(string))
  }))
}
