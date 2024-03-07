variable "dir_appids" {
  description = "List of directory application/SP combination IDs to be managed."
  type = list(object({
    display_name = string
    owners       = list(string)
  }))
}
