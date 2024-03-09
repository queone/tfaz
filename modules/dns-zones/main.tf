# Each zone
resource "azurerm_dns_zone" "zone" {
  for_each            = { for zone in var.dns_zones : zone.dns_zone_name => zone }
  name                = each.value.dns_zone_name
  resource_group_name = each.value.resource_group_name
  soa_record {
    email        = each.value.soa_records.email
    expire_time  = each.value.soa_records.expire_time
    host_name    = each.value.soa_records.host_name
    minimum_ttl  = each.value.soa_records.minimum_ttl
    refresh_time = each.value.soa_records.refresh_time
    retry_time   = each.value.soa_records.retry_time
    ttl          = each.value.soa_records.ttl
  }
}

# ==== A records for all zones ======================================
locals {
  a_records = flatten([
    for zone in var.dns_zones : [
      for a_record in(zone.a_records != null ? zone.a_records : []) : {
        zone_name           = zone.dns_zone_name
        resource_group_name = zone.resource_group_name
        name                = a_record.name
        ttl                 = a_record.ttl
        records             = a_record.records
      }
    ]
  ])
}
resource "azurerm_dns_a_record" "a" {
  for_each            = { for record in local.a_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
}

# ==== CNAME records for all zones ======================================
locals {
  cname_records = flatten([
    for zone in var.dns_zones : [
      for cname_record in(zone.cname_records != null ? zone.cname_records : []) : {
        zone_name           = zone.dns_zone_name
        resource_group_name = zone.resource_group_name
        name                = cname_record.name
        ttl                 = cname_record.ttl
        record              = cname_record.record
      }
    ]
  ])
}
resource "azurerm_dns_cname_record" "cname" {
  for_each            = { for record in local.cname_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}

# ==== MX records for all zones ======================================
locals {
  mx_records = flatten([
    for zone in var.dns_zones : [
      for mx_record in(zone.mx_records != null ? zone.mx_records : []) : {
        zone_name           = zone.dns_zone_name
        resource_group_name = zone.resource_group_name
        name                = mx_record.name
        ttl                 = mx_record.ttl
        records             = mx_record.records
      }
    ]
  ])
}
resource "azurerm_dns_mx_record" "mx" {
  for_each            = { for record in local.mx_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  dynamic "record" {
    for_each = each.value.records
    content {
      preference = record.value.preference
      exchange   = record.value.exchange
    }
  }
}

# ==== TXT records for all zones ======================================
locals {
  txt_records = flatten([
    for zone in var.dns_zones : [
      for txt_record in(zone.txt_records != null ? zone.txt_records : []) : {
        zone_name           = zone.dns_zone_name
        resource_group_name = zone.resource_group_name
        name                = txt_record.name
        ttl                 = txt_record.ttl
        records             = txt_record.records
      }
    ]
  ])
}
resource "azurerm_dns_txt_record" "txt" {
  for_each            = { for record in local.txt_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  dynamic "record" {
    for_each = each.value.records
    content {
      value = record.value
    }
  }
}

# ==== SRV records for all zones ======================================
locals {
  srv_records = flatten([
    for zone in var.dns_zones : [
      for srv_record in(zone.srv_records != null ? zone.srv_records : []) : [
        for rec in(srv_record.records != null ? srv_record.records : []) : {
          zone_name           = zone.dns_zone_name
          resource_group_name = zone.resource_group_name
          name                = srv_record.name
          ttl                 = srv_record.ttl
          priority            = rec.priority
          weight              = rec.weight
          port                = rec.port
          target              = rec.target
        }
      ]
    ]
  ])
}
resource "azurerm_dns_srv_record" "srv" {
  for_each            = { for record in local.srv_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record {
    priority = each.value.priority
    weight   = each.value.weight
    port     = each.value.port
    target   = each.value.target
  }
}

# ==== PTR records for all zones ======================================
locals {
  ptr_records = flatten([
    for zone in var.dns_zones : [
      for ptr_record in(zone.ptr_records != null ? zone.ptr_records : []) : {
        zone_name           = zone.dns_zone_name
        resource_group_name = zone.resource_group_name
        name                = ptr_record.name
        ttl                 = ptr_record.ttl
        records             = ptr_record.records
      }
    ]
  ])
}
resource "azurerm_dns_ptr_record" "ptr" {
  for_each            = { for record in local.ptr_records : "${record.zone_name}-${record.name}" => record }
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
}
