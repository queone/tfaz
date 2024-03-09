
variable "dns_zones" {
  description = "A list of DNS zones and their records"
  type = list(object({
    dns_zone_name       = string
    resource_group_name = string
    soa_records = optional(object({
      email        = string
      expire_time  = number
      host_name    = string
      minimum_ttl  = number
      refresh_time = number
      retry_time   = number
      ttl          = number
    }))
    a_records = optional(list(object({
      name    = string
      ttl     = number
      records = list(string)
    })))
    cname_records = optional(list(object({
      name   = string
      ttl    = number
      record = string
    })))
    mx_records = optional(list(object({
      name    = string
      ttl     = number
      records = list(object({
        preference = number
        exchange   = string
      }))
    })))
    txt_records = optional(list(object({
      name    = string
      ttl     = number
      records = list(string)
    })))
    srv_records = optional(list(object({
      name    = string
      ttl     = number
      records = list(object({
        priority = number
        weight   = number
        port     = number
        target   = string
      }))
    })))
    ptr_records = optional(list(object({
      name    = string
      ttl     = number
      records = list(string)
    })))
  }))
  default = []
}
