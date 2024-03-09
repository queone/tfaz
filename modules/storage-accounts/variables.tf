
variable "storage_accounts" {
  description = "List of Azure storage accounts to be managed."
  type = list(object({
    name        = string
    location    = optional(string)
    tags        = optional(map(string))
  }))
}

